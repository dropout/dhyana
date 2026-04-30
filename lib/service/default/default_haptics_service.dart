import 'package:flutter/services.dart';
import 'package:gaimon/gaimon.dart';

import '../haptics_service.dart';

class DefaultHapticsService implements HapticsService {
  @override
  void tap() => Gaimon.medium();

  @override
  void select() => Gaimon.selection();

  @override
  void error() => Gaimon.error();

  @override
  void success() => Gaimon.success();

  @override
  void patternFromData(String assetPath) async {
    final String response = await rootBundle
      .loadString(assetPath);
    Gaimon.patternFromData(response);
  }
}
