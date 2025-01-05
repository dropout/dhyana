import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PresenceBlocProvider extends StatelessWidget {

  final Widget child;
  final PresenceEvent? initialEvent;

  const PresenceBlocProvider({
    required this.child,
    this.initialEvent,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Services services = context.services;
    Repositories repos = context.repos;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState authState) {
        PresenceBloc presenceBloc = PresenceBloc(
          presenceRepository: repos.presenceRepository,
          profileRepository: repos.profileRepository,
          crashlyticsService: services.crashlyticsService,
        );
        if (initialEvent != null) {
          presenceBloc.add(initialEvent!);
        }
        return BlocProvider<PresenceBloc>(
          create: (BuildContext context) => presenceBloc,
          child: child,
        );
      }
    );
  }

}
