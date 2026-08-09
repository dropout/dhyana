import 'package:dhyana/modules/practice/session/data/mapper/session_mapper.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_entity.dart';
import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:dhyana/core/domain/enum/session_type.dart';

import 'package:dhyana/modules/practice/session/domain/usecase/log_session_insights_use_case.dart';
import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mock_definitions.dart';


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
      statsReport: const ProfileStatsReport(),
      completed: true,
    );
  }

  SessionEntity createSession() {
    return SessionEntity(
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

    when(() => insightsService.logSessionStatistics(profile.id, session.toApi()))
        .thenAnswer((_) async {});
    when(() => mindfulMinutesService.getAuthorizationStatus())
        .thenAnswer((_) async => AuthorizationStatus.authorized);
    when(() => mindfulMinutesService.logMindfulMinutes(
          session.startTime,
          session.endTime,
        )).thenAnswer((_) async {});

    await useCase.execute(profile.id, session);

    verify(() => insightsService.logSessionStatistics(profile.id, session.toApi())).called(1);
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

    when(() => insightsService.logSessionStatistics(profile.id, session.toApi()))
        .thenAnswer((_) async {});
    when(() => mindfulMinutesService.getAuthorizationStatus())
        .thenAnswer((_) async => unauthorizedStatus);

    await useCase.execute(profile.id, session);

    verify(() => insightsService.logSessionStatistics(profile.id, session.toApi())).called(1);
    verify(() => mindfulMinutesService.getAuthorizationStatus()).called(1);
    verifyNever(() => mindfulMinutesService.logMindfulMinutes(any(), any()));
  });
}
