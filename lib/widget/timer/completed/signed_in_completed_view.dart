import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/bloc/session_logger/session_logger_bloc.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/widget/timer/completed/all.dart';
import 'package:dhyana/widget/timer/completed/milestone_progress.dart';
import 'package:dhyana/widget/timer/completed/progress_summary.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/util/gap.dart';
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
            return buildLoaded(
              context,
              state.oldProfile,
              state.updatedProfile,
            );
          case SessionLoggerSavedState():
            return buildLoaded(
              context,
              state.oldProfile,
              state.updatedProfile,
            );
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

  Widget buildLoaded(
    BuildContext context,
    Profile oldProfile,
    Profile updatedProfile,
  ) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap.xxl(),
          SessionResult(
            timerState: widget.timerState,
            profile: updatedProfile,
          ),
          Gap.large(),
          MilestoneProgress(
            oldProfile: oldProfile,
            updatedProfile: updatedProfile,
          ),
          Gap.large(),
          ProgressSummary(
            oldProfile: oldProfile,
            updatedProfile: updatedProfile,
          ),
          Gap.xxl(),
          PresenceArea(
            profile: updatedProfile
          ),
          SizedBox(
            // as per size of bottom area gradient
            // see timer_screen.dart
            height: 160,
          ),
        ]
      ),
    );
  }

}
