import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_with_auth_provider_result_entity.freezed.dart';
part 'signin_with_auth_provider_result_entity.g.dart';

@freezed
sealed class SigninWithAuthProviderResultEntity with _$SigninWithAuthProviderResultEntity {
	const factory SigninWithAuthProviderResultEntity({
		required String userId,
		required bool isFirstSignin,
	}) = _SigninWithAuthProviderResultEntity;

	factory SigninWithAuthProviderResultEntity.fromJson(Map<String, dynamic> json) =>
			_$SigninWithAuthProviderResultEntityFromJson(json);
}
