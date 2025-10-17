import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PresenceBlocProvider extends StatelessWidget {

  final Widget child;
  final PresenceEvent? onCreateEvent;

  const PresenceBlocProvider({
    required this.child,
    this.onCreateEvent,
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
        return BlocProvider<PresenceBloc>(
          create: (BuildContext context) {
            if (onCreateEvent != null) {
              presenceBloc.add(onCreateEvent!);
            }
            return presenceBloc;
          },
          child: child,
        );
      }
    );
  }

}
