// import 'package:dhyana/core/service/module/auth_service.dart';
// import 'package:dhyana/modules/auth/domain/repository/auth_repository.dart';

// class DefaultAuthService implements AuthService {

//   final AuthRepository authRepository;

//   DefaultAuthService({
//     required this.authRepository,
//   });

//   @override
//   Stream<String?> get userIdStream {
//     return authRepository.authStateChange.asyncMap((user) async {
//       if (user == null) {
//         return null;
//       }
//       return user.uid;
//     });
//   }
//   @override
//   Future<({String userId, bool isFirstSignin})> signInWithApple() async {
//     final result = await authRepository.signIn(.apple);
//     return (userId: result.user.uid, isFirstSignin: result.isFirstSignin);
//   }
    
//   @override
//   Future<({String userId, bool isFirstSignin})> signInWithGoogle() async {
//     final result = await authRepository.signIn(.google);
//     return (userId: result.user.uid, isFirstSignin: result.isFirstSignin);
//   }

//   @override
//   Future<({String userId, bool isFirstSignin})> signInWithEmailAndPassword({
//     required String email, 
//     required String password
//   }) async {
//     final result = await authRepository.signIn(.emailAndPassword, email: email, password: password);
//     return (userId: result.user.uid, isFirstSignin: result.isFirstSignin);
//   }
  
  
//   @override
//   Future<void> signOut() => authRepository.signOut();

//   @override
//   Future<void> deleteUser() => authRepository.deleteUser();
  
// }