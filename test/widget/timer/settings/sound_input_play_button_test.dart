import 'dart:async';

import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/service/audio_service.dart';
import 'package:dhyana/widget/timer/sound_input_play_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../test_context_providers.dart';

class MockServices
    extends Mock
    implements Services {}

class MockAudioService
    extends Mock
    implements AudioService {}

void main() {

  late MockServices mockServices;
  late MockAudioService mockAudioService;
  late StreamController<bool> isPlayingStreamController;

  group('SoundInputPlayButton', () {

    setUp(() {
      mockAudioService = MockAudioService();
      isPlayingStreamController = StreamController();
      when(() => mockAudioService.isPlayingStream)
          .thenAnswer((_) => isPlayingStreamController.stream);

      mockServices = MockServices();
      when(() => mockServices.audioService)
          .thenReturn(mockAudioService);
    });

    tearDown(() {
      isPlayingStreamController.close();
    });

    testWidgets('renders with initial sound', (WidgetTester tester) async {

      await tester.pumpWidget(
        getAllTestContextProviders(
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

      when(() => mockAudioService.play(Sound.smallBell))
        .thenAnswer((_) async {
          isPlayingStreamController.add(true);
        });

      when(() => mockAudioService.stop())
        .thenAnswer((_) async {
          isPlayingStreamController.add(false);
        });

      await tester.pumpWidget(
        getAllTestContextProviders(
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
      verify(() => mockAudioService.play(Sound.smallBell)).called(1);

      await tester.tap(find.byKey(const Key('sound_input_play_button_stop')));
      await tester.pumpAndSettle();
      expect(state.isPlaying, isFalse);
      verify(() => mockAudioService.stop()).called(1);

    });

  });


}
