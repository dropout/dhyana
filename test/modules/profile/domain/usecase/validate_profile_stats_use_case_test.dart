import 'package:dhyana/core/domain/entity/fake/fake_model_factory.dart';
import 'package:dhyana/modules/profile/domain/usecase/validate_profile_stats_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../profile_mock_definitions.dart';

void main() {
  late MockProfileStatsUpdater profileStatsUpdater;
  late ValidateProfileStatsUseCase useCase;
  late FakeModelFactory fakeModelFactory;

  setUp(() {
    profileStatsUpdater = MockProfileStatsUpdater();
    fakeModelFactory = FakeModelFactory();
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
