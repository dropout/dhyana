import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/remote_settings.dart';
import 'package:dhyana/model/timer_settings.dart';

class InitResult {

  final TimerSettings timerSettings;
  final Services services;
  final Repositories repositories;
  final ProfileBloc profileBloc;
  final RemoteSettings remoteSettings;
  final User? user;

  InitResult({
    required this.timerSettings,
    required this.services,
    required this.repositories,
    required this.profileBloc,
    required this.remoteSettings,
    this.user
  });

}
