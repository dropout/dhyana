import 'package:wakelock_plus/wakelock_plus.dart';

import '../wakelock_service.dart';

class DefaultWakelockService implements WakelockService {

  @override
  Future<void> enable() async {
    WakelockPlus.enable();
  }

  @override
  Future<void> disable() async {
    WakelockPlus.disable();
  }

  @override
  Future<bool> isEnabled() async {
    return WakelockPlus.enabled;
  }

}
