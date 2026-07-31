import 'package:dhyana/modules/practice/timer/data/datasource/timer_auth_data_provider.dart';
import 'package:dhyana/core/data/datasource/timer_profile_data_provider.dart';

class DefaultTimerDataRepository {

  final TimerAuthDataProvider timerAuthDataProvider;
  final TimerProfileDataProvider timerProfileDataProvider;

  DefaultTimerDataRepository({
    required this.timerAuthDataProvider,
    required this.timerProfileDataProvider,
  });

  Future<TimerAuthData> getTimerAuthData() async {
    return await timerAuthDataProvider.getTimerAuthData();
  }

  Future<TimerProfileData> getTimerProfileData(String profileId) async {
    final timerProfileData = await timerProfileDataProvider.getTimerProfileData(profileId);
    return timerProfileData;
  }

}