import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/profile_settings.dart';
import 'package:dhyana/widget/presence/presence_area.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'milestone_progress_view.dart';
import 'progress_summary.dart';
import 'session_result.dart';


class SignedInCompletedView extends StatefulWidget {

  final String profileId;
  final Session session;
  final ProfileSettings profileSettings;

  const SignedInCompletedView({
    required this.profileId,
    required this.session,
    required this.profileSettings,
    super.key,
  });

  @override
  State<SignedInCompletedView> createState() => _SignedInCompletedViewState();
}

class _SignedInCompletedViewState extends State<SignedInCompletedView> {

  @override
  void initState() {
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    BlocProvider.of<SessionCompletedCubit>(context)
      .logSession(widget.profileId, widget.session,
        onComplete: (UpdateProfileStatsResult updateResult) {
          // refresh the profile
          profileCubit.loadProfile(
            widget.profileId,
            profile: updateResult.updatedProfile
          );
        },
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCompletedCubit, SessionCompletedState>(
      builder: (context, state) {
        switch (state) {
          case SessionCompletedInitialState():
            return buildLoading(context);
          case SessionCompletedLoadingState():
            return buildLoading(context);
          case SessionCompletedErrorState():
            return buildError(context);
          case SessionCompletedSavingState():
            return buildLoaded(context, state.updateResult);
          case SessionCompletedSavedState():
            return buildLoaded(context, state.updateResult);
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
    UpdateProfileStatsResult updateResult,
  ) {
    if (widget.profileSettings.usePresenceFeature == false &&
        widget.profileSettings.showStatsOnFinishScreen == false) {
      return SizedBox.expand(
        child: Center(
          child: SessionResult(
            session: widget.session,
            profile: updateResult.updatedProfile,
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap.xl(),
            SessionResult(
              session: widget.session,
              profile: updateResult.updatedProfile,
            ),
            Gap.xl(),
            if (widget.profileSettings.showStatsOnFinishScreen) MilestoneProgressView(
              profile: updateResult.updatedProfile,
              showAnimation: updateResult.updatedProfile.
                consecutiveDaysProgressCheck(updateResult.oldProfile),
              textColor: Colors.white,
            ),
            if (widget.profileSettings.showStatsOnFinishScreen) Gap.large(),
            if (widget.profileSettings.showStatsOnFinishScreen) ProgressSummary(
              oldProfile: updateResult.oldProfile,
              updatedProfile: updateResult.updatedProfile,
            ),
            if (widget.profileSettings.usePresenceFeature) Gap.xxl(),
            if (widget.profileSettings.usePresenceFeature) PresenceArea(
              profile: updateResult.updatedProfile
            ),
            SizedBox(
              // as per size of bottom area gradient - safearea bottom
              // see [session_completed_screen.dart]
              height: 140,
            ),
          ]
        ),
      ),
    );
  }

}
