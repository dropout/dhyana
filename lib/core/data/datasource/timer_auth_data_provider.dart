class TimerAuthData {
  final bool isAuthenticated;
  final String? userId;

  const TimerAuthData({
    required this.isAuthenticated,
    required this.userId,
  });
}

abstract interface class TimerAuthDataProvider {
  Future<TimerAuthData> getTimerAuthData();
}
