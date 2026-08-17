import 'dart:async';

import 'package:dhyana/core/domain/enum/sound.dart';
import 'package:dhyana/core/util/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/modules/practice/timer/public/view/timer_settings/sound_input_view.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
// transitive dependency required for shareValue() on Stream<PlaybackState>
// ignore: depend_on_referenced_packages

import '../../../../../../mock_definitions.dart';
import '../../../../../../test_context_providers.dart';

class FakeBuildContext extends Fake implements BuildContext {}

void main() {
  late MockHapticsService mockHapticsService;
  late MockServices mockServices;

  setUpAll(() {
    mockServices = MockServices();
    mockHapticsService = MockHapticsService();

    when(() => mockServices.hapticsService).thenReturn(mockHapticsService);

    registerFallbackValue(FakeBuildContext());
  });

  group('SoundInputView', () {
    testWidgets('renders with initial value', (WidgetTester tester) async {
      final PageStorageBucket bucket = PageStorageBucket();



      // when(() => mockAudioService.isPlayingStream)
      //   .thenAnswer((_) => Stream<bool>.value(false));

      // when(() => mockAudioHandler.customAction(AppAudioHandler.switchAction, any()))
      //   .thenAnswer((_) => Future.value(null));
      // when(() => mockAudioHandler.playbackState)
      //   .thenAnswer((_) => Stream.value(PlaybackState()).shareValue());

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>(
            create: (_) => mockServices,
            child: PageStorage(
              bucket: bucket,
              child: SoundInputView(initialValue: Sound.none)
            ),
          ),
        ),
      );

      expect(find.byType(SoundInputCard), findsWidgets);
      expect(find.text('Nincs hang'), findsOneWidget);
    });

    testWidgets('calls onchanged when value is changed', (
      WidgetTester tester,
    ) async {
      final PageStorageBucket bucket = PageStorageBucket();

      // when(() => mockAudioService.isPlayingStream)
      //   .thenAnswer((_) => Stream<bool>.value(false));

      final Completer<Sound> completer = Completer<Sound>();
      Sound changedValue = Sound.none;

      // when(() => mockAudioHandler.customAction(AppAudioHandler.switchAction, any()))
      //   .thenAnswer((_) => Future.value(null));
      // when(() => mockAudioHandler.playbackState)
      //   .thenAnswer((_) => Stream.value(PlaybackState()).shareValue());

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>(
            create: (_) => mockServices,
            child: PageStorage(
              bucket: bucket,
              child: SoundInputView(
                initialValue: Sound.none,
                onSelect: (Sound sound) {
                  completer.complete(sound);
                  changedValue = sound;
                },
              ),
            ),
          ),
        ),
      );

      final SoundInputViewState state = tester.state(
        find.byType(SoundInputView),
      );

      expect(state.selectedIndex, 0);

      await tester.fling(
        find.byType(PageView),
        const Offset(-100, 0), // Scroll one item to the left
        1000.0, // Speed of the fling
      );

      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('input_view_save_button')));
      await tester.pumpAndSettle();

      expect(changedValue, Sound.vibrate);
      expect(completer.isCompleted, isTrue);
      expect(state.selectedIndex, 1);
    });
  });
}
