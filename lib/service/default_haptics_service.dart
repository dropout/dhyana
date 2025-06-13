import 'package:flutter_vibrate/flutter_vibrate.dart';

import 'haptics_service.dart';

class DefaultHapticsService extends HapticsService {

  final bool canVibrate;

  DefaultHapticsService._create({
    required this.canVibrate,
  });

  @override
  void tap() {
    if (canVibrate) Vibrate.feedback(FeedbackType.impact);
  }

  @override
  void select() {
    if (canVibrate) Vibrate.feedback(FeedbackType.selection);
  }

  static Future<DefaultHapticsService> create() async {
    final bool canVibrate = await Vibrate.canVibrate;
    return DefaultHapticsService._create(
      canVibrate: canVibrate,
    );
  }

}
