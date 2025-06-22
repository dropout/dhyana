import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/service/audio_service.dart';
import 'package:dhyana/widget/timer/settings/sound_input_page.dart';
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

class FakeBuildContext
  extends Fake
  implements BuildContext {}

void main() {

  late MockServices mockServices;
  late MockAudioService mockAudioService;

  setUpAll(() {

    mockAudioService = MockAudioService();
    when(() => mockAudioService.isPlayingStream)
      .thenAnswer((_) => Stream<bool>.value(false));

    mockServices = MockServices();
    when(() => mockServices.audioService).thenReturn(mockAudioService);

    registerFallbackValue(FakeBuildContext());
  });

  group('SoundInputPage', () {

    testWidgets('renders with initial sound', (WidgetTester tester) async {

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>(
            create: (_) => mockServices,
            child: SoundInputPage(
              sound: Sound.smallBell,
              audioService: mockAudioService,
            ),
          ),
        ),
      );

      expect(find.byType(SoundInputPage), findsOneWidget);
      expect(find.byType(GestureDetector), findsOneWidget);
      expect(find.text('Csengettyű'), findsOneWidget);
    });

    testWidgets('plays sound on image tap', (WidgetTester tester) async {

      when(() => mockAudioService.play(Sound.smallBell))
        .thenAnswer((_) async {});



      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>(
            create: (_) => mockServices,
            child: SoundInputPage(
              sound: Sound.smallBell,
              audioService: mockAudioService,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      when(() => mockAudioService.isPlaying)
        .thenReturn(false);
      await tester.tap(
        find.byKey(const Key('sound_input_page_image_container'))
      );

      verify(() => mockAudioService.play(Sound.smallBell)).called(1);
    });

    testWidgets('stops sound on image tap if its already playing', (WidgetTester tester) async {

      when(() => mockAudioService.stop())
        .thenAnswer((_) async {});

      await tester.pumpWidget(
        withAllContextProviders(
          Provider<Services>(
            create: (_) => mockServices,
            child: SoundInputPage(
              sound: Sound.smallBell,
              audioService: mockAudioService,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      when(() => mockAudioService.isPlaying)
        .thenReturn(true);
      await tester.tap(
        find.byKey(const Key('sound_input_page_image_container'))
      );

      verify(() => mockAudioService.stop()).called(1);
    });


  });


}
