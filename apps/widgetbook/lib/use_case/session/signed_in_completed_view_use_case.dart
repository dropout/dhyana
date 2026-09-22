import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:social/social.dart';
import 'package:stepstones_widgetbook/get_it_scope.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:session/session.dart';

class MockPresenceCubit extends Mock implements PresenceCubit {}

@widgetbook.UseCase(
  name: 'Default',
  type: SignedInCompletedView,
  path: '[Session]/public/view/',
)
Widget buildSignedInCompletedView(BuildContext context) {
  final durationMinutes = context.knobs.int.slider(
    label: 'Duration (minutes)',
    initialValue: 10,
    min: 1,
    max: 120,
  );
  final type = context.knobs.object.dropdown(
    label: 'Session Type',
    options: SessionType.values,
    initialOption: SessionType.timer,
  );
  final endTime = DateTime.now();
  final profile = Profile.anonymous().copyWith(
  );

  return GetItScope(
    setupDependencies: (sl) async {
      await sl.reset();
      final mockPresenceCubit = MockPresenceCubit();
      final state = PresenceState.loaded(
        presenceList: Presence.fakeList(),
      );
      when(() => mockPresenceCubit.stream).thenAnswer((_) => Stream.value(state));
      when(() => mockPresenceCubit.state).thenReturn(state);
      when(() => mockPresenceCubit.loadPresenceData(
        ownProfileId: any(named: 'ownProfileId'),
        limit: any(named: 'limit'),
        windowSize: any(named: 'windowSize'),
      )).thenAnswer((_) async {});
      sl.registerFactory<PresenceCubit>(() => mockPresenceCubit);
      print('Registered mock PresenceCubit');
    },
    child: ColoredBox(
      color: Colors.black,
      child: SignedInCompletedView(
        profileId: profile.id,
        showStatsOnFinishScreen: true,
        usePresenceFeature: true,
        updateResult: UpdateProfileStatsResult(
          oldProfile: profile,
          updatedProfile: profile,
          session: Session(
            id: 'preview-session',
            type: type,
            startTime: endTime.subtract(Duration(minutes: durationMinutes)),
            endTime: endTime,
            duration: Duration(minutes: durationMinutes),
          ),
        ),
      ),
    ),
  );
}
