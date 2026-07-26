import 'package:dhyana/core/domain/repository/auth_repository.dart';
import 'package:dhyana/util/logger_mixin.dart';

enum DeleteProfileResult {
	completed,
	authRequired,
}

class DeleteProfileUseCase with LoggerMixin {
	final AuthRepository authRepository;

	DeleteProfileUseCase({
		required this.authRepository,
	});

	Future<DeleteProfileResult> execute() async {
		try {
			logger.t('Attempting to delete user account');
			await authRepository.deleteUser();
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
