import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/modules/profile/domain/usecase/delete_profile_use_case.dart';
import 'package:dhyana/modules/profile/presentation/viewmodel/delete_profile_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock_definitions.dart';

void main() {
  late MockDeleteProfileUseCase deleteProfileUseCase;
  late MockCrashlyticsService crashlyticsService;

  DeleteProfileCubit buildCubit() {
    return DeleteProfileCubit(
      deleteProfileUseCase: deleteProfileUseCase,
      crashlyticsService: crashlyticsService,
    );
  }

  setUp(() {
    deleteProfileUseCase = MockDeleteProfileUseCase();
    crashlyticsService = MockCrashlyticsService();

    when(
      () => crashlyticsService.recordError(
        exception: any(named: 'exception'),
        stackTrace: any(named: 'stackTrace'),
        reason: any(named: 'reason'),
      ),
    ).thenReturn(null);
  });

  group('DeleteProfileCubit.deleteProfile', () {
    blocTest<DeleteProfileCubit, DeleteProfileState>(
      'emits loading then completed when use case completes',
      build: buildCubit,
      setUp: () {
        when(() => deleteProfileUseCase.execute())
            .thenAnswer((_) async => DeleteProfileResult.completed);
      },
      act: (cubit) => cubit.deleteProfile(),
      expect: () => [
        const DeleteProfileState.loading(),
        const DeleteProfileState.completed(),
      ],
      verify: (_) {
        verify(() => deleteProfileUseCase.execute()).called(1);
        verifyNever(
          () => crashlyticsService.recordError(
            exception: any(named: 'exception'),
            stackTrace: any(named: 'stackTrace'),
            reason: any(named: 'reason'),
          ),
        );
      },
    );

    blocTest<DeleteProfileCubit, DeleteProfileState>(
      'emits loading then authRequired when use case requires re-auth',
      build: buildCubit,
      setUp: () {
        when(() => deleteProfileUseCase.execute())
            .thenAnswer((_) async => DeleteProfileResult.authRequired);
      },
      act: (cubit) => cubit.deleteProfile(),
      expect: () => [
        const DeleteProfileState.loading(),
        const DeleteProfileState.authRequired(),
      ],
      verify: (_) {
        verify(() => deleteProfileUseCase.execute()).called(1);
        verifyNever(
          () => crashlyticsService.recordError(
            exception: any(named: 'exception'),
            stackTrace: any(named: 'stackTrace'),
            reason: any(named: 'reason'),
          ),
        );
      },
    );

    blocTest<DeleteProfileCubit, DeleteProfileState>(
      'emits loading then error and records crashlytics when use case throws',
      build: buildCubit,
      setUp: () {
        when(() => deleteProfileUseCase.execute())
            .thenThrow(Exception('delete failed'));
      },
      act: (cubit) => cubit.deleteProfile(),
      expect: () => [
        const DeleteProfileState.loading(),
        const DeleteProfileState.error(),
      ],
      verify: (_) {
        verify(() => deleteProfileUseCase.execute()).called(1);
        verify(
          () => crashlyticsService.recordError(
            exception: any(named: 'exception'),
            stackTrace: any(named: 'stackTrace'),
            reason: 'Unable to delete user profile!',
          ),
        ).called(1);
      },
    );
  });
}
