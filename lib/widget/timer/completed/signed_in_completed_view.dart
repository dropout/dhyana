import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/bloc/session_logger/session_logger_bloc.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/consecutive_days_display.dart';
import 'package:dhyana/widget/timer/completed/all.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/util/separator_gem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignedInCompletedView extends StatefulWidget {

  final String profileId;
  final TimerSettings timerSettings;
  final TimerState timerState;

  const SignedInCompletedView({
    required this.profileId,
    required this.timerSettings,
    required this.timerState,
    super.key,
  });

  @override
  State<SignedInCompletedView> createState() => _SignedInCompletedViewState();
}

class _SignedInCompletedViewState extends State<SignedInCompletedView> {

  @override
  void initState() {
    BlocProvider.of<SessionLoggerBloc>(context).add(
      SessionLoggerEvent.logSession(
        profileId: widget.profileId,
        startTime: widget.timerState.startTime ?? DateTime.now().subtract(widget.timerState.elapsedTime),
        endTime: widget.timerState.endTime ?? DateTime.now(),
        duration: widget.timerState.elapsedTime,
        timerSettings: widget.timerSettings,
      )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionLoggerBloc, SessionLoggerState>(
      builder: (context, state) {
        switch (state) {
          case SessionLoggerInitialState():
            return buildLoading(context);
          case SessionLoggerLoadingState():
            return buildLoading(context);
          case SessionLoggerErrorState():
            return buildError(context);
          case SessionLoggerSavingState():
            return buildLoaded(context, state.updatedProfile);
          case SessionLoggerSavedState():
            return buildLoaded(context, state.updatedProfile);
          default:
            return SizedBox.shrink();
        }
      },
    );
  }

  Widget buildLoading(BuildContext context) {
    return const AppLoadingDisplay();
  }

  Widget buildError(BuildContext context) {
    return const AppErrorDisplay();
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
    return SingleChildScrollView(
      child: Column(
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
          PresenceArea(profile: profile),
          const SizedBox(height: AppThemeData.spacing4xl),
        ]
      ),
    );
  }

}
