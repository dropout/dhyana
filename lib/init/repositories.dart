import 'package:dhyana/repository/all.dart';

class Repositories {

  final AuthRepository authRepository;
  final ProfileRepository profileRepository;
  final PresenceRepository presenceRepository;
  final StatisticsRepository statisticsRepository;
  final TimerSettingsHistoryRepository timerSettingsHistoryRepository;

  const Repositories({
    required this.authRepository,
    required this.profileRepository,
    required this.presenceRepository,
    required this.statisticsRepository,
    required this.timerSettingsHistoryRepository,
  });

}
