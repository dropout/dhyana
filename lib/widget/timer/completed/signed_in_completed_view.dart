import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/bloc_provider/all.dart';
import 'package:dhyana/widget/profile/stats/consecutive_days.dart';
import 'package:dhyana/widget/timer/completed/all.dart';
import 'package:dhyana/widget/util/separator_gem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignedInCompletedView extends StatefulWidget {

  final void Function()? onInit;
  final TimerState timerState;
  final User user;

  const SignedInCompletedView({
    required this.timerState,
    required this.user,
    this.onInit,
    super.key
  });

  @override
  State<SignedInCompletedView> createState() => _SignedInCompletedViewState();
}

class _SignedInCompletedViewState extends State<SignedInCompletedView> {

  @override
  void initState() {
    widget.onInit?.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileBlocProvider(
      initialEvent: ProfileEvent.loadProfile(
        profileId: widget.user.uid,
      ),
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
    return const Text('profile loading');
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
        const SizedBox(height: AppThemeData.spacing2xl),
        ConsecutiveDays(
          profile: profile,
        ),
        PresenceArea(profile: profile),
        const SizedBox(height: AppThemeData.spacing4xl),
      ]
    );
  }

}
