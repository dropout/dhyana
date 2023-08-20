import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:dhyana/widgets/bloc_provider/all.dart';
import 'package:dhyana/widgets/timer/completed/all.dart';
import 'package:dhyana/widgets/timer/completed/session_result.dart';
import 'package:dhyana/widgets/util/separator_gem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presence_area.dart';

class SignedInView extends StatefulWidget {

  final TimerState timerState;
  final User user;

  const SignedInView({
    required this.timerState,
    required this.user,
    super.key
  });

  @override
  State<SignedInView> createState() => _SignedInViewState();
}

class _SignedInViewState extends State<SignedInView> {

  @override
  Widget build(BuildContext context) {
    return ProfileBlocProvider(
      initialEvent: ProfileEvent.loadProfile(profileId: widget.user.uid),
      child: buildColumn(context),
    );
  }

  Widget buildColumn(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        switch (state) {
          case ProfileLoadedState():
            return buildLoaded(context, state.profile);
          default:
            return buildLoading(context);
        }
      },
    );
  }

  Widget buildLoading(BuildContext context) {
    return Text('profile loading');
  }

  Widget buildSeparator(BuildContext context, {
    EdgeInsets padding = const EdgeInsets.symmetric(
      vertical: AppThemeData.spacingLg
    ),
  }) {
    return SeparatorGem(
      count: 1,
      gemSize: 12,
      padding: padding,
      color: Colors.white,
    );
  }

  Widget buildLoaded(BuildContext context, Profile profile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: AppThemeData.spacing2xl),
        SessionResult(
          timerState: widget.timerState,
          profile: profile,
        ),
        const SizedBox(height: AppThemeData.spacingLg),
        WeeklyPerformance(
          profile: profile,
        ),
        buildSeparator(context, padding: const EdgeInsets.only(
          top: AppThemeData.spacingLg + 12,
          bottom: AppThemeData.spacingLg,
        )),
        ConsecutiveDays(
          profile: profile,
        ),
        // const SizedBox(height: AppThemeData.spacingLg),
        buildSeparator(context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppThemeData.spacingLg),
          child: PresenceArea(
            profile: profile,
          ),
        ),
        const SizedBox(height: AppThemeData.spacing4xl),
      ]
    );
  }
}
