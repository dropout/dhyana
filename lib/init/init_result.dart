import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/remote_settings.dart';
import 'package:dhyana/model/timer_settings.dart';

class InitResult {

  final TimerSettings timerSettings;
  final Services services;
  final Repositories repositories;
  final ProfileCubit profileCubit;
  final RemoteSettings remoteSettings;
  final User? user;

  InitResult({
    required this.timerSettings,
    required this.services,
    required this.repositories,
    required this.profileCubit,
    required this.remoteSettings,
    this.user
  });

}
