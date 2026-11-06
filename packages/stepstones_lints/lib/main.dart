import 'package:analysis_server_plugin/plugin.dart';
import 'package:analysis_server_plugin/registry.dart';

import 'src/domain_layer_isolation_rule.dart';

final plugin = StepstonesLintsPlugin();

class StepstonesLintsPlugin extends Plugin {
  @override
  String get name => 'stepstones_lints';

  @override
  void register(PluginRegistry registry) {
    registry.registerWarningRule(DomainLayerIsolationRule());
  }
}
