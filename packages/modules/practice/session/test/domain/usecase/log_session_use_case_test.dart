import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:profile/profile.dart';

import 'package:session/src/domain/entity/session_entity.dart';
import 'package:session/src/domain/usecase/log_session_insights_use_case.dart';
import 'package:stats/stats.dart';

import '../../session_mock_definitions.dart';

void main() {
  late MockStatsPublicApi mockStatsPublicApi;
  late MockMindfulMinutesService mindfulMinutesService;
  late MockSessionAppPort mockSessionAppPort;
  late LogSessionInsightsUseCase useCase;

  setUp(() {
    mockStatsPublicApi = MockStatsPublicApi();
    mindfulMinutesService = MockMindfulMinutesService();
    mockSessionAppPort = MockSessionAppPort();

    useCase = LogSessionInsightsUseCase(sessionAppPort: mockSessionAppPort);
  });

  Profile createProfile() {
    return Profile(
      id: 'profile-1',
      firstName: 'Ada',
      lastName: 'Lovelace',
      email: 'ada@dhyana.app',
      photoUrl: null,
      photoBlurhash: null,
      signupDate: DateTime(2026, 1, 1),
      statsReport: const ProfileStatsReport(),
      completed: true,
    );
  }

  SessionEntity createSession() {
    return SessionEntity(
      id: 'session-1',
      type: .timer,
      startTime: DateTime(2026, 1, 2, 10, 0),
      endTime: DateTime(2026, 1, 2, 10, 20),
      duration: const Duration(minutes: 20),
    );
  }

  test('logs to statistics and mindful minutes when authorized', () async {
    final profile = createProfile();
    final session = createSession();
    final s = StatsSession(
      id: session.id,
      startTime: session.startTime,
      endTime: session.endTime,
      duration: session.duration,
      type: .sitting,
    );

    when(() => mockSessionAppPort.isMindfulMinutesAuthorized())
      .thenAnswer((_) async => true);
    when(() => mockSessionAppPort.logSessionStatistics(profile.id, s))
      .thenAnswer((_) async {});
    when(() => mockSessionAppPort.logMindfulMinutes(session.startTime, session.endTime))
      .thenAnswer((_) async {});


    await useCase.execute(profile.id, session);

    verify(() => mockSessionAppPort.logSessionStatistics(profile.id, s)).called(1);
    verify(() => mockSessionAppPort.isMindfulMinutesAuthorized()).called(1);
    verify(() => mockSessionAppPort.logMindfulMinutes(session.startTime, session.endTime)).called(1);

  });

  test(
    'logs to statistics but skips mindful minutes when not authorized',
    () async {
      final profile = createProfile();
      final session = createSession();

      final s = StatsSession(
        id: session.id,
        startTime: session.startTime,
        endTime: session.endTime,
        duration: session.duration,
        type: .sitting,
      );

      when(() => mockSessionAppPort.isMindfulMinutesAuthorized())
        .thenAnswer((_) async => false);
      when(() => mockSessionAppPort.logSessionStatistics(profile.id, s))
        .thenAnswer((_) async {});
      when(() => mockSessionAppPort.logMindfulMinutes(session.startTime, session.endTime))
        .thenAnswer((_) async {});

      await useCase.execute(profile.id, session);

      verify(() => mockSessionAppPort.logSessionStatistics(profile.id, s)).called(1);
      verify(() => mockSessionAppPort.isMindfulMinutesAuthorized()).called(1);
      verifyNever(() => mockSessionAppPort.logMindfulMinutes(session.startTime, session.endTime));
    },
  );
}
