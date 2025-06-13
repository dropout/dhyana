import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:provider/provider.dart';

class InitResult {

  final TimerSettings timerSettings;
  final DefaultServices services;
  final Repositories repositories;
  final List<Provider> providers;
  final ProfileBloc profileBloc;
  final User? user;

  InitResult({
    required this.timerSettings,
    required this.services,
    required this.repositories,
    required this.providers,
    required this.profileBloc,
    this.user
  });

}
