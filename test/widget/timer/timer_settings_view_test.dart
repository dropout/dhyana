import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/timer/all.dart';
import 'package:dhyana/widget/timer/settings/duration_input.dart';
import 'package:dhyana/widget/timer/settings/sound_input.dart';
import 'package:dhyana/widget/timer/settings/warmup_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../get_localization_provider.dart';

void main() {

  testWidgets('TimerSettingsView has all the necessary interface elements', (WidgetTester tester) async {

    TimerSettings timerSettings = TimerSettings.initial();

    await tester.pumpWidget(
      getLocalizationsProvider(
        const Locale('hu', 'HU'),
        TimerSettingsView(timerSettings: timerSettings)
      )
    );
    await tester.pumpAndSettle();

    expect(find.byType(WarmupTimeInput), findsOneWidget);
    expect(find.byType(SoundInput), findsExactly(2));
    expect(find.byType(DurationInput), findsOneWidget);
    expect(find.text('START'), findsOneWidget);
    
  });

}
