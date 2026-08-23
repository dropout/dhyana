/// Pure path-classification helpers for [domain_layer_isolation_rule.dart].
///
/// All paths are expected to be normalized with forward slashes, as produced
/// by the analyzer's [Source.fullName]/[LibraryFragment.source.fullName].
library;

/// Matches a domain-layer file under `lib/modules/**/domain/`.
///
/// Deliberately excludes `lib/core/domain` — core is exempt from this rule.
final _domainFileRegExp = RegExp(r'/lib/modules/(.+?)/domain/');

/// Returns the module root path (everything up to and including the module
/// segment right before `/domain/`), or `null` if [filePath] isn't a domain
/// file this rule should check.
String? moduleRootFor(String filePath) {
  final match = _domainFileRegExp.firstMatch(filePath);
  if (match == null) return null;
  return filePath.substring(0, match.end - '/domain/'.length);
}

/// Whether [libRoot] (the absolute path of the project's `lib/` directory)
/// is a prefix of [targetPath], i.e. the import resolves inside this project.
bool isProjectLibPath(String targetPath, String libRoot) =>
    targetPath.startsWith(libRoot);

/// Whether the resolved import target is allowed from a domain-layer file.
///
/// [targetPath] is the absolute file path the import resolves to.
/// [libRoot] is the absolute path of the project's `lib/` directory.
/// [moduleRoot] is the module root computed by [moduleRootFor] for the
/// importing file.
bool isAllowedDomainImport({
  required String targetPath,
  required String libRoot,
  required String moduleRoot,
}) {
  // External packages and the Dart SDK never resolve under this project's lib/.
  if (!isProjectLibPath(targetPath, libRoot)) return true;

  if (targetPath.startsWith('$libRoot/core/')) return true;
  if (targetPath.startsWith('$moduleRoot/domain/')) return true;

  return _isUnderAnyModulePublicFolder(targetPath);
}

final _modulePublicRegExp = RegExp(r'/lib/modules/(?:[^/]+/)+public/');

bool _isUnderAnyModulePublicFolder(String targetPath) =>
    _modulePublicRegExp.hasMatch(targetPath);
