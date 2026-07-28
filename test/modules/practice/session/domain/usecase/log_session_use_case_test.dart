import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/core/domain/enum/session_type.dart';
import 'package:dhyana/core/domain/repository/statistics_repository.dart';
import 'package:dhyana/core/domain/service/mindful_minutes_service.dart';
import 'package:dhyana/modules/insights/domain/model/profile_statistics_report.dart';
import 'package:dhyana/modules/practice/session/domain/usecase/log_session_statistics_use_case.dart';
import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockStatisticsRepository extends Mock implements StatisticsRepository {}

class MockMindfulMinutesService extends Mock implements MindfulMinutesService {}

void main() {
  late MockStatisticsRepository statisticsRepository;
  late MockMindfulMinutesService mindfulMinutesService;
  late LogSessionStatisticsUseCase useCase;

  setUp(() {
    statisticsRepository = MockStatisticsRepository();
    mindfulMinutesService = MockMindfulMinutesService();
    useCase = LogSessionStatisticsUseCase(
      statisticsRepository: statisticsRepository,
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

    when(() => statisticsRepository.logSession(profile, session))
        .thenAnswer((_) async {});
    when(() => mindfulMinutesService.getAuthorizationStatus())
        .thenAnswer((_) async => AuthorizationStatus.authorized);
    when(() => mindfulMinutesService.logMindfulMinutes(
          session.startTime,
          session.endTime,
        )).thenAnswer((_) async {});

    await useCase.execute(profile, session);

    verify(() => statisticsRepository.logSession(profile, session)).called(1);
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

    when(() => statisticsRepository.logSession(profile, session))
        .thenAnswer((_) async {});
    when(() => mindfulMinutesService.getAuthorizationStatus())
        .thenAnswer((_) async => unauthorizedStatus);

    await useCase.execute(profile, session);

    verify(() => statisticsRepository.logSession(profile, session)).called(1);
    verify(() => mindfulMinutesService.getAuthorizationStatus()).called(1);
    verifyNever(() => mindfulMinutesService.logMindfulMinutes(any(), any()));
  });
}
