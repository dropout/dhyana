import 'package:dhyana/modules/auth/data/datasource/auth/auth_provider.dart';
import 'package:dhyana/core/data/datasource/timer_auth_data_provider.dart';

class DefaultTimerAuthDataProvider implements TimerAuthDataProvider {

  final AuthProvider authProvider;

  const DefaultTimerAuthDataProvider({
    required this.authProvider,
  });
  
  @override
  Future<TimerAuthData> getTimerAuthData() async {
    // Check if signed in
    final user = authProvider.user;
    if (user != null) {
      return TimerAuthData(
        isAuthenticated: true,
        userId: user.uid,
      );
    } else {
      return TimerAuthData(
        isAuthenticated: false,
        userId: null,
      );
    }
  }

}