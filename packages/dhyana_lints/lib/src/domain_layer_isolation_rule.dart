import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'domain_import_path_rules.dart';

/// Flags imports inside `lib/modules/**/domain/` files that reach outside
/// the module's own domain layer, `lib/core/`, or another module's `public/`
/// API. `lib/core/domain` is exempt.
class DomainLayerIsolationRule extends DartLintRule {
  const DomainLayerIsolationRule() : super(code: _code);

  static const _code = LintCode(
    name: 'domain_layer_isolation',
    problemMessage:
        "Domain layer must not depend on '{0}'. A module's domain/ may only "
        'import its own domain/, lib/core/, or another module\'s public/ API.',
    errorSeverity: .WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    DiagnosticReporter reporter,
    CustomLintContext context,
  ) {
    final filePath = resolver.path.replaceAll(r'\', '/');
    final moduleRoot = moduleRootFor(filePath);
    if (moduleRoot == null) return;

    final libRootIndex = filePath.indexOf('/lib/');
    if (libRootIndex == -1) return;
    final libRoot = filePath.substring(0, libRootIndex + '/lib'.length);

    context.registry.addImportDirective((node) {
      final targetPath =
          node.libraryImport?.importedLibrary?.firstFragment.source.fullName
              .replaceAll(r'\', '/');
      if (targetPath == null) return;

      if (isAllowedDomainImport(
        targetPath: targetPath,
        libRoot: libRoot,
        moduleRoot: moduleRoot,
      )) {
        return;
      }

      reporter.atNode(
        node.uri,
        _code,
        arguments: [targetPath.substring(libRoot.length + 1)],
      );
    });
  }
}
