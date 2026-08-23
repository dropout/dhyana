import 'package:custom_lint_builder/custom_lint_builder.dart';

import 'src/domain_layer_isolation_rule.dart';

PluginBase createPlugin() => _DhyanaLintsPlugin();

class _DhyanaLintsPlugin extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const DomainLayerIsolationRule(),
      ];
}
