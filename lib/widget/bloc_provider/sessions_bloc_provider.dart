import 'package:dhyana/bloc/sessions/sessions_bloc.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    Services services = context.services;
    Repositories repos = context.repos;
    return BlocProvider<SessionsBloc>(
      create: (BuildContext context) {
        SessionsBloc sessionsBloc = SessionsBloc(
          authRepository: repos.authRepository,
          sessionRepository: repos.sessionRepository,
          crashlyticsService: services.crashlyticsService,
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
