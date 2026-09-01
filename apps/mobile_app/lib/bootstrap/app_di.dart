import 'package:get_it/get_it.dart';

import 'package:core/core.dart';
import 'package:auth/auth.dart';
import 'package:profile/profile.dart';
import 'package:stats/stats.dart';
import 'package:session/session.dart';
import 'package:timer/timer.dart';
import 'package:chanting/chanting.dart';
import 'package:social/social.dart';


extension AppDependencyInjection on GetIt {

  Future<void> registerDependencies() async {
    await registerCoreDependencies();
    registerAuthModuleDependencies();
    registerProfileModuleDependencies();
    registerSocialModuleDependencies();
    registerSessionModuleDependencies();
    registerStatsModuleDependencies();
    registerTimerModuleDependencies();
    registerChantingModuleDependencies();
  }

}
