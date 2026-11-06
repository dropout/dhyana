/// Pure path-classification helpers for [domain_layer_isolation_rule.dart].
///
/// Mirrors the domain checks in
/// `support/maintenance_scripts/check_module_boundaries.sh`. Paths are expected
/// to be absolute and normalized with forward slashes.
library;

/// Why an import is not allowed in a feature module's domain layer.
enum DomainImportViolation {
  platformPackage(
    'platform and framework packages belong in data/ or presentation/',
  ),
  flutterUi('Flutter UI libraries belong in presentation/'),
  ownOuterLayer(
    "the module's own data/, presentation/ and public/ layers depend on domain, not the other way round",
  ),
  otherModule(
    'other feature modules may only be reached through a port in domain/port/',
  );

  const DomainImportViolation(this.reason);

  final String reason;
}

const _domainSegment = '/lib/src/domain/';

final _platformPackageRegExp = RegExp(
  r'^(flutter_[a-z_]+|cloud_firestore|firebase_[a-z_]+|drift|go_router|get_it|material_ui)$',
);

const _flutterUiLibraries = {'material.dart', 'widgets.dart', 'cupertino.dart'};

const _ownOuterLayers = ['src/data/', 'src/presentation/', 'src/public/'];

/// Returns the module package root (the directory holding `lib/`) when
/// [filePath] is a feature-module domain file this rule checks, else `null`.
///
/// Ports are skipped because they are the sanctioned bridge to other modules.
String? domainModuleRootFor(String filePath) {
  final index = filePath.indexOf(_domainSegment);
  if (index == -1) return null;

  final moduleRoot = filePath.substring(0, index);
  if (!moduleRoot.contains('/packages/modules/')) return null;

  if (filePath.contains('${_domainSegment}port/') ||
      filePath.endsWith('_port.dart')) {
    return null;
  }
  return moduleRoot;
}

/// Returns the violation for [importUri] inside the domain layer of the module
/// rooted at [moduleRoot], or `null` when the import is allowed.
///
/// [targetPath] is the resolved file path of the import, when available; it
/// catches relative imports and imports of other feature modules.
DomainImportViolation? domainImportViolation({
  required String importUri,
  required String? targetPath,
  required String moduleRoot,
}) {
  final moduleName = moduleRoot.substring(moduleRoot.lastIndexOf('/') + 1);

  if (importUri.startsWith('package:')) {
    final uriPath = importUri.substring('package:'.length);
    final slash = uriPath.indexOf('/');
    if (slash != -1) {
      final package = uriPath.substring(0, slash);
      final library = uriPath.substring(slash + 1);

      if (_platformPackageRegExp.hasMatch(package)) {
        return DomainImportViolation.platformPackage;
      }
      if (package == 'flutter' && _flutterUiLibraries.contains(library)) {
        return DomainImportViolation.flutterUi;
      }
      if (package == moduleName && _ownOuterLayers.any(library.startsWith)) {
        return DomainImportViolation.ownOuterLayer;
      }
    }
  }

  if (targetPath == null) return null;

  if (targetPath.startsWith('$moduleRoot/lib/src/') &&
      !targetPath.startsWith('$moduleRoot$_domainSegment')) {
    return DomainImportViolation.ownOuterLayer;
  }
  if (targetPath.contains('/packages/modules/') &&
      !targetPath.startsWith('$moduleRoot/')) {
    return DomainImportViolation.otherModule;
  }
  return null;
}
