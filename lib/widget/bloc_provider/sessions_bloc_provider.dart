import 'package:dhyana/bloc/sessions/sessions_cubit.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionsCubitProvider extends StatelessWidget {

  final Widget child;
  final Function(SessionsCubit)? onCreate;

  const SessionsCubitProvider({
    required this.child,
    this.onCreate,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Services services = context.services;
    Repositories repos = context.repos;
    return BlocProvider<SessionsCubit>(
      create: (BuildContext context) {
        SessionsCubit sessionsBloc = SessionsCubit(
          authRepository: repos.authRepository,
          statisticsRepository: repos.statisticsRepository,
          crashlyticsService: services.crashlyticsService,
        );
        onCreate?.call(sessionsBloc);
        return sessionsBloc;
      },
      child: child,
    );
  }

}
