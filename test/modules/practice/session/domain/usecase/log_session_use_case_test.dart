import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/core/domain/enum/session_type.dart';
import 'package:dhyana/core/domain/entity/profile/profile_statistics_report.dart';
import 'package:dhyana/modules/practice/session/domain/usecase/log_session_insights_use_case.dart';
import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mock_definitions.dart';

// class MockStatisticsRepository extends Mock implements StatisticsRepository {}
// class MockMindfulMinutesService extends Mock implements MindfulMinutesService {}

void main() {
  late MockInsightsService insightsService;
  late MockMindfulMinutesService mindfulMinutesService;
  late LogSessionInsightsUseCase useCase;

  setUp(() {
    insightsService = MockInsightsService();
    mindfulMinutesService = MockMindfulMinutesService();
    useCase = LogSessionInsightsUseCase(
      insightsService: insightsService,
      mindfulMinutesService: mindfulMinutesService,
    );
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
      statsReport: const ProfileStatisticsReport(),
      completed: true,
    );
  }

  Session createSession() {
    return Session(
      id: 'session-1',
      type: SessionType.sitting,
      startTime: DateTime(2026, 1, 2, 10, 0),
      endTime: DateTime(2026, 1, 2, 10, 20),
      duration: const Duration(minutes: 20),
    );
  }

  test('logs to statistics and mindful minutes when authorized', () async {
    final profile = createProfile();
    final session = createSession();

    when(() => insightsService.logSessionStatistics(profile.id, session))
        .thenAnswer((_) async {});
    when(() => mindfulMinutesService.getAuthorizationStatus())
        .thenAnswer((_) async => AuthorizationStatus.authorized);
    when(() => mindfulMinutesService.logMindfulMinutes(
          session.startTime,
          session.endTime,
        )).thenAnswer((_) async {});

    await useCase.execute(profile, session);

    verify(() => insightsService.logSessionStatistics(profile.id, session)).called(1);
    verify(() => mindfulMinutesService.getAuthorizationStatus()).called(1);
    verify(() => mindfulMinutesService.logMindfulMinutes(
          session.startTime,
          session.endTime,
        )).called(1);
  });

  test('logs to statistics but skips mindful minutes when not authorized', () async {
    final profile = createProfile();
    final session = createSession();
    final unauthorizedStatus = AuthorizationStatus.values.firstWhere(
      (status) => status != AuthorizationStatus.authorized,
      orElse: () => AuthorizationStatus.authorized,
    );

    when(() => insightsService.logSessionStatistics(profile.id, session))
        .thenAnswer((_) async {});
    when(() => mindfulMinutesService.getAuthorizationStatus())
        .thenAnswer((_) async => unauthorizedStatus);

    await useCase.execute(profile, session);

    verify(() => insightsService.logSessionStatistics(profile.id, session)).called(1);
    verify(() => mindfulMinutesService.getAuthorizationStatus()).called(1);
    verifyNever(() => mindfulMinutesService.logMindfulMinutes(any(), any()));
  });
}
