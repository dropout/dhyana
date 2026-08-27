import 'package:dhyana/core/domain/repository/storage_repository.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/modules/auth/auth_module.dart';
import 'package:dhyana/modules/profile/domain/repository/profile_repository.dart';

enum DeleteProfileResult {
	completed,
	authRequired,
}

class DeleteProfileUseCase with LoggerMixin {
	final AuthPublicApi authApi;
  final ProfileRepository profileRepository;
  final StorageRepository storageRepository;

	DeleteProfileUseCase({
		required this.authApi,
		required this.profileRepository,
		required this.storageRepository,
	});

	Future<DeleteProfileResult> execute() async {
		try {
			logger.t('Attempting to delete user account');
      final authSession = await authApi.authSessionStream.first;

      // First check if the user is authenticated before proceeding with deletion
      if (!authSession.isAuthenticated || authSession.userId == null) {
        logger.t('User is not authenticated. Cannot delete profile.');
        return DeleteProfileResult.authRequired;
      } else {      
        // Attempt to delete the user account
        // May throw an exception if the user needs to re-authenticate
        await authApi.deleteUser();
        logger.t('User account deleted successfully');

        // After successfully deleting the user account, 
        // proceed to delete the profile data and associated storage
        await profileRepository.delete(authSession.userId!);
        await storageRepository.deleteProfileFolder(authSession.userId!);

        return DeleteProfileResult.completed;
      }
		} on Exception catch (e) {
			if (e.toString().contains('requires-recent-login')) {
				logger.t('User deletion requires re-authentication');
				return DeleteProfileResult.authRequired;
			}
			rethrow;
		}
	}
}
