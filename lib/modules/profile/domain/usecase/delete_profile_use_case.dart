import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/modules/auth/public/public.dart';

enum DeleteProfileResult {
	completed,
	authRequired,
}

class DeleteProfileUseCase with LoggerMixin {
	final AuthPublicApi authApi;

	DeleteProfileUseCase({
		required this.authApi,
	});

	Future<DeleteProfileResult> execute() async {
		try {
			logger.t('Attempting to delete user account');
			await authApi.deleteUser();
			logger.t('User account deleted successfully');
			return DeleteProfileResult.completed;
		} on Exception catch (e) {
			if (e.toString().contains('requires-recent-login')) {
				logger.t('User deletion requires re-authentication');
				return DeleteProfileResult.authRequired;
			}
			rethrow;
		}
	}
}
