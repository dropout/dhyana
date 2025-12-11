import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/presence/presence_cubit.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PresenceCubitProvider extends StatelessWidget {

  final Widget child;
  final Function(PresenceCubit)? onCreate;

  const PresenceCubitProvider({
    required this.child,
    this.onCreate,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Services services = context.services;
    Repositories repos = context.repos;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState authState) {
        final presenceCubit = PresenceCubit(
          presenceRepository: repos.presenceRepository,
          profileRepository: repos.profileRepository,
          crashlyticsService: services.crashlyticsService,
        );
        return BlocProvider<PresenceCubit>(
          create: (BuildContext context) {
            onCreate?.call(presenceCubit);
            return presenceCubit;
          },
          child: child,
        );
      }
    );
  }

}
