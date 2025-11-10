import 'package:wakelock_plus/wakelock_plus.dart';

class WakelockService {

  Future<void> enable() async {
    WakelockPlus.enable();
  }

  Future<void> disable() async {
    WakelockPlus.disable();
  }

  Future<bool> isEnabled() async {
    return WakelockPlus.enabled;
  }

}
