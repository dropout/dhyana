#!/bin/bash
# Builds a signed iOS ad-hoc IPA, distributes it via Firebase App Distribution
# to the ios_testers group and uploads Crashlytics symbols.
set -euo pipefail

TESTER_GROUP="ios_testers"
NOTES=""
DRY_RUN=0

usage() {
  echo "Usage: $0 <flavor> [--notes <text>] [--dry-run]"
  exit 1
}

[ $# -ge 1 ] || usage
FLAVOR="$1"
shift
while [ $# -gt 0 ]; do
  case "$1" in
    --notes) NOTES="${2:?}"; shift 2 ;;
    --dry-run) DRY_RUN=1; shift ;;
    *) usage ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
APP_DIR="$REPO_ROOT/apps/mobile_app"
PUBSPEC="$APP_DIR/pubspec.yaml"
EXPORT_OPTIONS="$SCRIPT_DIR/ExportOptions.plist"
SCHEME="$APP_DIR/ios/Runner.xcodeproj/xcshareddata/xcschemes/$FLAVOR.xcscheme"
ENTRYPOINT="lib/main_$FLAVOR.dart"
PLIST="$APP_DIR/ios/config/$FLAVOR/GoogleService-Info.plist"
SYMBOLS_DIR="$APP_DIR/build/symbols"

[ -f "$SCHEME" ] || { echo "Error: unknown flavor '$FLAVOR' (no Xcode scheme at $SCHEME)."; exit 1; }
[ -f "$APP_DIR/$ENTRYPOINT" ] || { echo "Error: entry point $ENTRYPOINT missing for flavor '$FLAVOR'."; exit 1; }
[ -f "$PLIST" ] || { echo "Error: Firebase config missing for flavor '$FLAVOR': $PLIST"; exit 1; }

run() {
  echo "+ $*"
  [ "$DRY_RUN" -eq 1 ] || "$@"
}

for tool in flutter firebase xcodebuild git; do
  command -v "$tool" >/dev/null || { echo "Error: '$tool' not found."; exit 1; }
done
[ -f "$EXPORT_OPTIONS" ] || { echo "Error: $EXPORT_OPTIONS missing."; exit 1; }

cd "$REPO_ROOT"
if [ -n "$(git status --porcelain)" ]; then
  echo "Error: git working tree is not clean."
  exit 1
fi

# The flavor's plist is the source of truth for the Firebase project and app.
PROJECT="$(/usr/libexec/PlistBuddy -c 'Print :PROJECT_ID' "$PLIST")"
APP_ID="${FIREBASE_IOS_APP_ID:-$(/usr/libexec/PlistBuddy -c 'Print :GOOGLE_APP_ID' "$PLIST")}"

# Bump only the build number (+N), keeping the version intact.
CURRENT="$(grep -E '^version: [0-9]+\.[0-9]+\.[0-9]+\+[0-9]+$' "$PUBSPEC" | head -1 | awk '{print $2}')"
[ -n "$CURRENT" ] || { echo "Error: cannot parse version in $PUBSPEC."; exit 1; }
VERSION_NAME="${CURRENT%+*}"
NEW_BUILD=$(( ${CURRENT##*+} + 1 ))
NEW_VERSION="$VERSION_NAME+$NEW_BUILD"
echo "Version: $CURRENT -> $NEW_VERSION ($FLAVOR: project $PROJECT, app id $APP_ID)"

BUMPED=0
cleanup() {
  if [ "$BUMPED" -eq 1 ]; then
    echo "Failed, restoring pubspec.yaml"
    git -C "$REPO_ROOT" checkout -- "$PUBSPEC"
  fi
}
trap cleanup EXIT

if [ "$DRY_RUN" -eq 0 ]; then
  sed -i '' -E "s/^version: .*/version: $NEW_VERSION/" "$PUBSPEC"
  BUMPED=1
fi

cd "$APP_DIR"
rm -rf build/ios/ipa build/ios/archive "$SYMBOLS_DIR"
run flutter build ipa --release --flavor "$FLAVOR" -t "$ENTRYPOINT" \
  --obfuscate --split-debug-info="$SYMBOLS_DIR" \
  --export-options-plist="$EXPORT_OPTIONS"

IPA="$(ls build/ios/ipa/*.ipa 2>/dev/null | head -1 || true)"
if [ "$DRY_RUN" -eq 0 ] && [ -z "$IPA" ]; then
  echo "Error: IPA not found."
  exit 1
fi
[ -n "$NOTES" ] || NOTES="Build $NEW_VERSION"

run firebase appdistribution:distribute "${IPA:-build/ios/ipa/app.ipa}" \
  --app "$APP_ID" --project "$PROJECT" \
  --groups "$TESTER_GROUP" --release-notes "$NOTES"

# The build number is consumed once the upload succeeds, so keep and commit it.
if [ "$DRY_RUN" -eq 0 ]; then
  BUMPED=0
  git -C "$REPO_ROOT" add "$PUBSPEC"
  git -C "$REPO_ROOT" commit -m "chore: bump build number to $NEW_BUILD" \
    -m "Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>"
fi

# Native dSYMs (SwiftPM checkout first, then CocoaPods).
UPLOAD_SYMBOLS="$(ls -d "$HOME"/Library/Developer/Xcode/DerivedData/Runner-*/SourcePackages/checkouts/firebase-ios-sdk/Crashlytics/upload-symbols \
  "$APP_DIR"/ios/Pods/FirebaseCrashlytics/upload-symbols 2>/dev/null | head -1 || true)"
if [ -z "$UPLOAD_SYMBOLS" ]; then
  [ "$DRY_RUN" -eq 1 ] || { echo "Error: Crashlytics upload-symbols binary not found (build $NEW_VERSION is already distributed and committed)."; exit 1; }
  UPLOAD_SYMBOLS="upload-symbols"
fi
run "$UPLOAD_SYMBOLS" -gsp "$PLIST" -p ios build/ios/archive/Runner.xcarchive/dSYMs

# The Dart symbols file is covered by the App.framework dSYM above (same UUID);
# crashlytics:symbols:upload cannot process iOS Mach-O symbol files.
echo "Done: $FLAVOR $NEW_VERSION distributed to $TESTER_GROUP in $PROJECT."
