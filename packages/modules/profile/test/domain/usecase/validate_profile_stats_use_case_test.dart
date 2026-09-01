import 'package:faker/faker.dart';
import 'package:profile/src/data/datasource/faker_profile_extension.dart';
import 'package:profile/src/domain/usecase/validate_profile_stats_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../profile_mock_definitions.dart';


void main() {
  late MockProfileStatsUpdater profileStatsUpdater;
  late ValidateProfileStatsUseCase useCase;
  late Faker fakeModelFactory;

  setUp(() {
    profileStatsUpdater = MockProfileStatsUpdater();
    fakeModelFactory = Faker();
    useCase = ValidateProfileStatsUseCase(
      profileStatsReportUpdater: profileStatsUpdater,
    );
  });

  group('ValidateProfileStatsUseCase.execute', () {
    test('delegates to updater and returns validated stats report', () async {
      final profile = fakeModelFactory.createProfileEntity();
      final statsReport = profile.statsReport;
      final validatedStatsReport = statsReport.copyWith(
        completedDaysCount: statsReport.completedDaysCount + 1,
      );

      when(() => profileStatsUpdater.validateStatsReport(statsReport))
          .thenReturn(validatedStatsReport);

      final result = await useCase.execute(statsReport);

      expect(result, equals(validatedStatsReport));
      verify(() => profileStatsUpdater.validateStatsReport(statsReport)).called(1);
    });
  });
}
