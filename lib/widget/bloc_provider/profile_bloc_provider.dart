import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/util/profile_stats_report_updater.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    Services services = context.services;
    Repositories repos = context.repos;
    return BlocProvider<ProfileBloc>(
      create: (context) {
        ProfileBloc profileBloc = ProfileBloc(
          profileRepository: repos.profileRepository,
          statisticsRepository: repos.statisticsRepository,
          crashlyticsService: services.crashlyticsService,
          idGeneratorService: services.idGeneratorService,
          profileStatsUpdater: ProfileStatsReportUpdater(),
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
