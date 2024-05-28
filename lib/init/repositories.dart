import 'package:dhyana/repository/day_repository.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/repository/presence_repository.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/repository/session_repository.dart';
import 'package:dhyana/repository/timer_settings_history_repository.dart';

class Repositories {

  final AuthRepository authRepository;
  final ProfileRepository profileRepository;
  final PresenceRepository presenceRepository;
  final SessionRepository sessionRepository;
  final DayRepository dayRepository;
  final TimerSettingsHistoryRepository timerSettingsHistoryRepository;

  const Repositories({
    required this.authRepository,
    required this.profileRepository,
    required this.presenceRepository,
    required this.sessionRepository,
    required this.dayRepository,
    required this.timerSettingsHistoryRepository,
  });

}
