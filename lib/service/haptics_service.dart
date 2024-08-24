import 'package:flutter_vibrate/flutter_vibrate.dart';

class HapticsService {

  final bool canVibrate;

  HapticsService._create({
    required this.canVibrate,
  });

  void tap() {
    if (canVibrate) Vibrate.feedback(FeedbackType.impact);
  }

  void select() {
    if (canVibrate) Vibrate.feedback(FeedbackType.selection);
  }

  static Future<HapticsService> create() async {
    final bool canVibrate = await Vibrate.canVibrate;
    return HapticsService._create(
      canVibrate: canVibrate,
    );
  }

}
