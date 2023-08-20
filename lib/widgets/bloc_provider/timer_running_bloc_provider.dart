import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/bloc/sessions/sessions_bloc.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/repository/presence_repository.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/repository/session_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/default_audio_service.dart';
import 'package:dhyana/service/default_timer_service.dart';
import 'package:dhyana/service/timer_service_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class TimerRunningBlocProvider extends StatelessWidget {

  final TimerSettings timerSettings;
  final Widget child;

  const TimerRunningBlocProvider({
    required this.timerSettings,
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    AuthRepository authRepository =
      Provider.of<AuthRepository>(context);

    ProfileRepository profileRepository =
      Provider.of<ProfileRepository>(context);

    PresenceRepository presenceRepository =
      Provider.of<PresenceRepository>(context);

    SessionRepository sessionRepository =
      Provider.of<SessionRepository>(context);

    CrashlyticsService crashlyticsService =
      Provider.of<CrashlyticsService>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            return TimerBloc(
              timerSettings: timerSettings,
              timerServiceFactory: TimerServiceFactory<DefaultTimerService>(
                DefaultTimerService.new
              ),
              audioService: DefaultAudioService(),
              crashlyticsService: crashlyticsService,
            );
          },
          lazy: false,
        ),
        BlocProvider<PresenceBloc>(
          create: (BuildContext context) {
            return PresenceBloc(
              presenceRepository: presenceRepository,
              authRepository: authRepository,
              profileRepository: profileRepository,
              crashlyticsService: crashlyticsService,
            );
          },
          lazy: false,
        ),
        BlocProvider<SessionsBloc>(
          create: (BuildContext context) {
            return SessionsBloc(
              authRepository: authRepository,
              sessionRepository: sessionRepository,
              crashlyticsService: crashlyticsService,
            );
          },
        ),
        // BlocProvider<ProfileBloc>(
        //   create: (BuildContext context) {
        //     return ProfileBloc(
        //       profileRepository: profileRepository,
        //       crashlyticsService: crashlyticsService,
        //     );
        //   }
        // )
      ],
      child: child
    );
  }

}
