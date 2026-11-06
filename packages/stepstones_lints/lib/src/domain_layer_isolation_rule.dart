import 'package:analyzer/analysis_rule/analysis_rule.dart';
import 'package:analyzer/analysis_rule/rule_context.dart';
import 'package:analyzer/analysis_rule/rule_visitor_registry.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/error/error.dart';

import 'domain_import_path_rules.dart';

/// Flags imports in a feature module's `lib/src/domain/` that reach platform
/// packages, Flutter UI, the module's outer layers, or other feature modules.
class DomainLayerIsolationRule extends AnalysisRule {
  static const LintCode code = LintCode(
    'domain_layer_isolation',
    "Domain layer must not import '{0}': {1}.",
    correctionMessage:
        'Depend on a domain interface or port and implement it in data/.',
    severity: DiagnosticSeverity.WARNING,
  );

  DomainLayerIsolationRule()
    : super(
        name: 'domain_layer_isolation',
        description:
            "Keeps a feature module's domain layer free of platform, UI and "
            'cross-module dependencies.',
      );

  @override
  LintCode get diagnosticCode => code;

  @override
  void registerNodeProcessors(
    RuleVisitorRegistry registry,
    RuleContext context,
  ) {
    final filePath = context.definingUnit.file.path.replaceAll(r'\', '/');
    final moduleRoot = domainModuleRootFor(filePath);
    if (moduleRoot == null) return;

    registry.addImportDirective(this, _Visitor(this, moduleRoot));
  }
}

class _Visitor extends SimpleAstVisitor<void> {
  _Visitor(this.rule, this.moduleRoot);

  final AnalysisRule rule;
  final String moduleRoot;

  @override
  void visitImportDirective(ImportDirective node) {
    final importUri = node.uri.stringValue;
    if (importUri == null) return;

    final targetPath = node
        .libraryImport
        ?.importedLibrary
        ?.firstFragment
        .source
        .fullName
        .replaceAll(r'\', '/');

    final violation = domainImportViolation(
      importUri: importUri,
      targetPath: targetPath,
      moduleRoot: moduleRoot,
    );
    if (violation == null) return;

    rule.reportAtNode(node.uri, arguments: [importUri, violation.reason]);
  }
}
