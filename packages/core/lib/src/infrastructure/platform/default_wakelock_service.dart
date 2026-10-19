import 'package:flutter/foundation.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'package:core/src/service/wakelock_service.dart';


class DefaultWakelockService implements WakelockService {

  @override
  Future<void> enable() async {
    debugPrint('Enabling wakelock');
    WakelockPlus.enable();
  }

  @override
  Future<void> disable() async {
    debugPrint('Disabling wakelock');
    WakelockPlus.disable();
  }

  @override
  Future<bool> isEnabled() async {
    return WakelockPlus.enabled;
  }

}
