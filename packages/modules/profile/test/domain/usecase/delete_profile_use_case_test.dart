import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:profile/src/domain/usecase/delete_profile_use_case.dart';

import '../../profile_mock_definitions.dart';


void main() {
  late MockAuthPublicApi authService;
  late DeleteProfileUseCase useCase;
  late MockProfileRepository profileRepository;
  late MockStorageRepository storageRepository;

  setUp(() {
    authService = MockAuthPublicApi();
    profileRepository = MockProfileRepository();
    storageRepository = MockStorageRepository();

    useCase = DeleteProfileUseCase(
      authApi: authService,
      profileRepository: profileRepository,
      storageRepository: storageRepository,
    );
  });

  group('DeleteProfileUseCase.execute', () {
    test('returns completed when user deletion succeeds', () async {
      when(() => authService.deleteUser()).thenAnswer((_) async {});
      when(() => authService.authSessionStream).thenAnswer(
        (_) => Stream.value((isAuthenticated: true, userId: 'user123')),
      );
      when(() => profileRepository.delete(any())).thenAnswer((_) async {});
      when(() => storageRepository.deleteProfileFolder(any())).thenAnswer((_) async {});

      final result = await useCase.execute();

      expect(result, DeleteProfileResult.completed);
      verify(() => authService.deleteUser()).called(1);
      verify(() => profileRepository.delete('user123')).called(1);
      verify(() => storageRepository.deleteProfileFolder('user123')).called(1);
    });

    test('returns authRequired when deletion requires recent login', () async {
      when(() => authService.authSessionStream).thenAnswer(
        (_) => Stream.value((isAuthenticated: true, userId: 'user123')),
      );
      when(
        () => authService.deleteUser(),
      ).thenThrow(Exception('requires-recent-login'));

      final result = await useCase.execute();

      expect(result, DeleteProfileResult.authRequired);
      verify(() => authService.deleteUser()).called(1);
    });

    test('rethrows non-auth-related exceptions', () async {    
      final exception = Exception('network-error');
      when(() => authService.authSessionStream).thenAnswer(
        (_) => Stream.value((isAuthenticated: true, userId: 'user123')),
      );
      when(() => authService.deleteUser()).thenThrow(exception);

      expect(() => useCase.execute(), throwsA(same(exception)));
      verifyNever(() => authService.deleteUser());
    });
  });
}
