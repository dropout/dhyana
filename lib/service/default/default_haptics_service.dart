import 'package:gaimon/gaimon.dart';

import '../haptics_service.dart';

class DefaultHapticsService implements HapticsService {

  @override
  void tap() {
    Gaimon.medium();
  }

  @override
  void select() {
    Gaimon.selection();
  }
}
