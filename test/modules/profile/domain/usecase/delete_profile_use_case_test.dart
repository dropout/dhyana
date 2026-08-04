import 'package:dhyana/modules/profile/domain/usecase/delete_profile_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock_definitions.dart';

void main() {
  late MockAuthPublicApi authService;
  late DeleteProfileUseCase useCase;

  setUp(() {
    authService = MockAuthPublicApi();
    useCase = DeleteProfileUseCase(authApi: authService);
  });

  group('DeleteProfileUseCase.execute', () {
    test('returns completed when user deletion succeeds', () async {
      when(() => authService.deleteUser()).thenAnswer((_) async {});

      final result = await useCase.execute();

      expect(result, DeleteProfileResult.completed);
      verify(() => authService.deleteUser()).called(1);
    });

    test('returns authRequired when deletion requires recent login', () async {
      when(
        () => authService.deleteUser(),
      ).thenThrow(Exception('requires-recent-login'));

      final result = await useCase.execute();

      expect(result, DeleteProfileResult.authRequired);
      verify(() => authService.deleteUser()).called(1);
    });

    test('rethrows non-auth-related exceptions', () async {
      final exception = Exception('network-error');
      when(() => authService.deleteUser()).thenThrow(exception);

      expect(() => useCase.execute(), throwsA(same(exception)));
      verify(() => authService.deleteUser()).called(1);
    });
  });
}
