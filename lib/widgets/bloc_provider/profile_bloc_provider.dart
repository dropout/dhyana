import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:dhyana/service/crashlytics_service.dart';

class ProfileBlocProvider extends StatelessWidget {

  final Widget child;

  const ProfileBlocProvider({
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    CrashlyticsService crashlyticsService =
      Provider.of<CrashlyticsService>(context);

    ProfileRepository profileRepository =
      Provider.of<ProfileRepository>(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState authState) {
        switch(authState) {
          case AuthStateSignedIn():
            return BlocProvider<ProfileBloc>(
              create: (context) => ProfileBloc(
                profileRepository: profileRepository,
                crashlyticsService: crashlyticsService,
              )..add(ProfileEvent.loadProfile(profileId: authState.user.uid)),
              child: child,
            );
          default:
            return const Text('User not signed in');
        }

      }
    );

  }

}
