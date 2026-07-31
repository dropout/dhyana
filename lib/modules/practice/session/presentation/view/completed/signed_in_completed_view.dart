import 'package:dhyana/modules/practice/session/domain/entity/session_completed_data.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/core/presentation/viewmodel/profile/profile_cubit.dart';
import 'package:dhyana/modules/practice/session/presentation/viewmodel/session_completed/session_completed_cubit.dart';
import 'package:dhyana/core/domain/entity/profile/profile_settings.dart';
import 'package:dhyana/modules/practice/session/domain/entity/update_profile_stats_result.dart';
import 'package:dhyana/modules/social/presentation/view/presence_area.dart';
import 'package:dhyana/core/presentation/view/util/app_error_display.dart';
import 'package:dhyana/core/presentation/view/util/app_loading_display.dart';
import 'package:dhyana/core/presentation/view/util/gap.dart';
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
    final profileCubit = context.read<ProfileCubit>();
    context.read<SessionCompletedCubit>().logSession(
      widget.profileId,
      widget.session,
      onComplete: (UpdateProfileStatsResult updateResult) {
        // refresh the profile
        profileCubit.loadProfile(
          widget.profileId,
          profile: updateResult.updatedProfile,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCompletedCubit, SessionCompletedData>(
      builder: (context, state) {
        switch (state) {
          case SessionCompletedInitialData():
            return buildLoading(context);
          case SessionCompletedLoadingData():
            return buildLoading(context);
          case SessionCompletedErrorData():
            return buildError(context);
          case SessionCompletedSavingData():
            return buildLoaded(context, state.updateResult);
          case SessionCompletedSavedData():
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
            if (widget.profileSettings.showStatsOnFinishScreen)
              MilestoneProgressView(
                profile: updateResult.updatedProfile,
                showAnimation: updateResult.updatedProfile
                    .consecutiveDaysProgressCheck(updateResult.oldProfile),
                textColor: Colors.white,
              ),
            if (widget.profileSettings.showStatsOnFinishScreen) Gap.large(),
            if (widget.profileSettings.showStatsOnFinishScreen)
              ProgressSummary(
                oldProfile: updateResult.oldProfile,
                updatedProfile: updateResult.updatedProfile,
              ),
            if (widget.profileSettings.usePresenceFeature) Gap.xxl(),
            if (widget.profileSettings.usePresenceFeature)
              PresenceArea(profile: updateResult.updatedProfile),
            SizedBox(
              // as per size of bottom area gradient - safearea bottom
              // see [session_completed_screen.dart]
              height: 140,
            ),
          ],
        ),
      ),
    );
  }
}
