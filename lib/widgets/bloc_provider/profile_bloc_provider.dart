import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:dhyana/service/crashlytics_service.dart';

class ProfileBlocProvider extends StatelessWidget {
  final Widget child;
  final ProfileEvent? initialEvent;
  const ProfileBlocProvider({
    required this.child,
    this.initialEvent,
    super.key
  });
  @override
  Widget build(BuildContext context) {
    CrashlyticsService crashlyticsService =
      Provider.of<CrashlyticsService>(context);
    ProfileRepository profileRepository =
      Provider.of<ProfileRepository>(context);
    return BlocProvider<ProfileBloc>(
      create: (context) {
        ProfileBloc profileBloc = ProfileBloc(
          profileRepository: profileRepository,
          crashlyticsService: crashlyticsService,
        );
        if (initialEvent != null) {
          profileBloc.add(initialEvent!);
        }
        return profileBloc;
      },
      child: child,
    );
  }
}
