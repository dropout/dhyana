import 'dart:async';

import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/widget/timer/settings/sound_input_play_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../mock_definitions.dart';
import '../../../test_context_providers.dart';

void main() {

  late MockServices mockServices;
  late MockTimerAudioService mockAudioService;
  late StreamController<bool> isPlayingStreamController;

  group('SoundInputPlayButton', () {

    setUp(() {
      mockAudioService = MockTimerAudioService();
      isPlayingStreamController = StreamController();
      when(() => mockAudioService.isPlayingStream)
          .thenAnswer((_) => isPlayingStreamController.stream);

      mockServices = MockServices();

    });

    tearDown(() {
      isPlayingStreamController.close();
    });

    testWidgets('renders with initial sound', (WidgetTester tester) async {

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>(
            create: (_) => mockServices,
            child: SoundInputPlayButton(
              sound: Sound.smallBell,
              audioService: mockAudioService,
            ),
          ),
        ),
      );

      final SoundInputPlayButtonState state =
        tester.state(find.byType(SoundInputPlayButton));

      expect(find.byIcon(Icons.play_circle_fill_rounded), findsOneWidget);
      expect(state.isPlaying, isFalse);
    });

    testWidgets('can play and stop a sound', (WidgetTester tester) async {

      when(() => mockAudioService.playSound(Sound.smallBell))
        .thenAnswer((_) async {
          isPlayingStreamController.add(true);
        });

      when(() => mockAudioService.stop())
        .thenAnswer((_) async {
          isPlayingStreamController.add(false);
        });

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>(
            create: (_) => mockServices,
            child: SoundInputPlayButton(
              sound: Sound.smallBell,
              audioService: mockAudioService,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final SoundInputPlayButtonState state =
        tester.state(find.byType(SoundInputPlayButton));

      expect(state.isPlaying, isFalse);
      await tester.tap(find.byKey(const Key('sound_input_play_button_play')));
      await tester.pumpAndSettle();
      expect(state.isPlaying, isTrue);
      verify(() => mockAudioService.playSound(Sound.smallBell)).called(1);

      await tester.tap(find.byKey(const Key('sound_input_play_button_stop')));
      await tester.pumpAndSettle();
      expect(state.isPlaying, isFalse);
      verify(() => mockAudioService.stop()).called(1);

    });

  });


}
