import 'package:dhyana/modules/profile/domain/usecase/delete_profile_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock_definitions.dart';

void main() {
  late MockAuthRepository authRepository;
  late DeleteProfileUseCase useCase;

  setUp(() {
    authRepository = MockAuthRepository();
    useCase = DeleteProfileUseCase(authRepository: authRepository);
  });

  group('DeleteProfileUseCase.execute', () {
    test('returns completed when user deletion succeeds', () async {
      when(() => authRepository.deleteUser()).thenAnswer((_) async {});

      final result = await useCase.execute();

      expect(result, DeleteProfileResult.completed);
      verify(() => authRepository.deleteUser()).called(1);
    });

    test('returns authRequired when deletion requires recent login', () async {
      when(
        () => authRepository.deleteUser(),
      ).thenThrow(Exception('requires-recent-login'));

      final result = await useCase.execute();

      expect(result, DeleteProfileResult.authRequired);
      verify(() => authRepository.deleteUser()).called(1);
    });

    test('rethrows non-auth-related exceptions', () async {
      final exception = Exception('network-error');
      when(() => authRepository.deleteUser()).thenThrow(exception);

      expect(() => useCase.execute(), throwsA(same(exception)));
      verify(() => authRepository.deleteUser()).called(1);
    });
  });
}
