import 'dart:async';

import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/service/audio_service.dart';
import 'package:dhyana/service/haptics_service.dart';
import 'package:dhyana/widget/timer/settings/sound_input_page.dart';
import 'package:dhyana/widget/timer/settings/sound_input_play_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/widget/timer/settings/sound_input_view.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../test_context_providers.dart';

class MockHapticsService
  extends Mock
  implements HapticsService {}

class MockServices
  extends Mock
  implements Services {}

class MockAudioService
  extends Mock
  implements AudioService {}

class FakeBuildContext
  extends Fake
  implements BuildContext {}

void main() {

  late MockHapticsService mockHapticsService;
  late MockAudioService mockAudioService;
  late MockServices mockServices;

  setUpAll(() {
    mockServices = MockServices();
    mockHapticsService = MockHapticsService();
    mockAudioService = MockAudioService();

    when(() => mockServices.hapticsService).thenReturn(mockHapticsService);
    when(() => mockServices.audioService).thenReturn(mockAudioService);

    registerFallbackValue(FakeBuildContext());
  });

  group('SoundInputView', () {

    testWidgets('renders with initial value', (WidgetTester tester) async {

      when(() => mockAudioService.isPlayingStream)
        .thenAnswer((_) => Stream<bool>.value(false));

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>(
            create: (_) => mockServices,
            child: SoundInputView(
              initialValue: Sound.none,
            ),
          )
        )
      );

      expect(find.byType(SoundInputPage), findsOneWidget);
      expect(find.byType(SoundInputPlayButton), findsOneWidget);
      expect(find.text('Nincs hang'), findsOneWidget);
      expect(find.byType(SoundInputPlayButton), findsOneWidget);
    });

    testWidgets('calls onchanged when value is changed', (WidgetTester tester) async  {

      when(() => mockAudioService.isPlayingStream)
        .thenAnswer((_) => Stream<bool>.value(false));

      final Completer<Sound> completer = Completer<Sound>();
      Sound changedValue = Sound.none;

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>(
            create: (_) => mockServices,
            child: SoundInputView(
              initialValue: Sound.none,
              onSelect: (Sound sound) {
                completer.complete(sound);
                changedValue = sound;
              },
            ),
          )
        )
      );

      final SoundInputViewState state =
        tester.state(find.byType(SoundInputView));

      expect(state.selectedIndex, 0);

      await tester.fling(
        find.byType(PageView),
        const Offset(-100, 0), // Scroll one item to the left
        1000.0, // Speed of the fling
      );

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('input_view_save_button')));
      await tester.pumpAndSettle();

      expect(changedValue, Sound.smallBell);
      expect(completer.isCompleted, isTrue);
      expect(state.selectedIndex, 1);

    });

  });
}
