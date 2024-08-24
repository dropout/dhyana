import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:provider/provider.dart';

class InitResult {

  final TimerSettings timerSettings;
  final Services services;
  final Repositories repositories;
  final List<Provider> providers;
  final User? user;

  InitResult({
    required this.timerSettings,
    required this.services,
    required this.repositories,
    required this.providers,
    this.user
  });

}
