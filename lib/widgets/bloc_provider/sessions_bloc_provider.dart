import 'package:dhyana/bloc/sessions/sessions_bloc.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/repository/session_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SessionsBlocProvider extends StatelessWidget {

  final Widget child;
  final SessionsEvent? initialEvent;

  const SessionsBlocProvider({
    required this.child,
    this.initialEvent,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    AuthRepository authRepository =
    Provider.of<AuthRepository>(context);

    SessionRepository sessionRepository =
    Provider.of<SessionRepository>(context);

    CrashlyticsService crashlyticsService =
    Provider.of<CrashlyticsService>(context);

    return BlocProvider<SessionsBloc>(
      create: (BuildContext context) {
        SessionsBloc sessionsBloc = SessionsBloc(
          authRepository: authRepository,
          sessionRepository: sessionRepository,
          crashlyticsService: crashlyticsService,
        );
        if (initialEvent != null) {
          sessionsBloc.add(initialEvent!);
        }
        return sessionsBloc;
      },
      child: child,
    );
  }

}
