import 'package:dhyana/core/service/module/auth_service.dart';
import 'package:dhyana/core/util/logger_mixin.dart';

enum DeleteProfileResult {
	completed,
	authRequired,
}

class DeleteProfileUseCase with LoggerMixin {
	final AuthService authService;

	DeleteProfileUseCase({
		required this.authService,
	});

	Future<DeleteProfileResult> execute() async {
		try {
			logger.t('Attempting to delete user account');
			await authService.deleteUser();
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
