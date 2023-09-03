import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/repository/presence_repository.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:dhyana/service/crashlytics_service.dart';

class PresenceBlocProvider extends StatelessWidget {

  final Widget child;

  const PresenceBlocProvider({
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    CrashlyticsService crashlyticsService =
      Provider.of<CrashlyticsService>(context);
    PresenceRepository presenceRepository =
      Provider.of<PresenceRepository>(context);
    ProfileRepository profileRepository =
      Provider.of<ProfileRepository>(context);
    AuthRepository authRepository =
      Provider.of<AuthRepository>(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState authState) {

        return BlocProvider<PresenceBloc>(
          create: (BuildContext context) {
            return PresenceBloc(
              presenceRepository: presenceRepository,
              authRepository: authRepository,
              profileRepository: profileRepository,
              crashlyticsService: crashlyticsService,
            );
          },
          child: child,
        );

      }
    );
  }

}
