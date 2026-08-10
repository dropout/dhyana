import 'package:dhyana/modules/insights/public/model/stats_session.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_entity.dart';
import 'package:dhyana/modules/profile/profile_module.dart';
import 'package:dhyana/core/domain/enum/home_screen_view_state.dart';

import 'package:dhyana/modules/practice/session/domain/usecase/log_session_insights_use_case.dart';
import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mock_definitions.dart';


void main() {
  late MockStatsPublicApi mockStatsPublicApi;
  late MockMindfulMinutesService mindfulMinutesService;
  late LogSessionInsightsUseCase useCase;

  setUp(() {
    mockStatsPublicApi = MockStatsPublicApi();
    mindfulMinutesService = MockMindfulMinutesService();
    useCase = LogSessionInsightsUseCase(
      statsPublicApi: mockStatsPublicApi,
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
      type: HomeScreenViewState.sitting,
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

    when(() => mockStatsPublicApi.logSessionStatistics(profile.id, s))
        .thenAnswer((_) async {});
    when(() => mindfulMinutesService.getAuthorizationStatus())
        .thenAnswer((_) async => AuthorizationStatus.authorized);
    when(() => mindfulMinutesService.logMindfulMinutes(
          session.startTime,
          session.endTime,
        )).thenAnswer((_) async {});

    await useCase.execute(profile.id, session);

    verify(() => mockStatsPublicApi.logSessionStatistics(profile.id, s)).called(1);
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

    final s = StatsSession(
      id: session.id,
      startTime: session.startTime,
      endTime: session.endTime,
      duration: session.duration,
      type: .sitting,
    );

    when(() => mockStatsPublicApi.logSessionStatistics(profile.id, s))
        .thenAnswer((_) async {});
    when(() => mindfulMinutesService.getAuthorizationStatus())
        .thenAnswer((_) async => unauthorizedStatus);

    await useCase.execute(profile.id, session);

    verify(() => mockStatsPublicApi.logSessionStatistics(profile.id, s)).called(1);
    verify(() => mindfulMinutesService.getAuthorizationStatus()).called(1);
    verifyNever(() => mindfulMinutesService.logMindfulMinutes(any(), any()));
  });
}
