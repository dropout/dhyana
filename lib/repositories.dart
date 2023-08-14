import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/repository/profile_repository.dart';

class Repositories {

  final AuthRepository authRepository;
  final ProfileRepository profileRepository;

  const Repositories({
    required this.authRepository,
    required this.profileRepository,
  });

}
