import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/model/all.dart';
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

  const SignedInCompletedView({
    required this.profileId,
    required this.session,
    super.key,
  });

  @override
  State<SignedInCompletedView> createState() => _SignedInCompletedViewState();
}

class _SignedInCompletedViewState extends State<SignedInCompletedView> {

  @override
  void initState() {
    final profileCubit = BlocProvider.of<ProfileCubit>(context);
    BlocProvider.of<SessionCompletedBloc>(context).add(
      SessionCompletedEvent.logSession(
        profileId: widget.profileId,
        session: widget.session,
        onComplete: (UpdateProfileStatsResult updateResult) {
          // refresh the profile
          profileCubit.loadProfile(
            widget.profileId,
            profile: updateResult.updatedProfile
          );
        },
      )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCompletedBloc, SessionCompletedState>(
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
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap.xl(),
            SessionResult(
              session: widget.session,
              profile: updateResult.updatedProfile,
            ),
            Gap.large(),
            MilestoneProgressView(
              profile: updateResult.updatedProfile,
              showAnimation: updateResult.updatedProfile.
                consecutiveDaysProgressCheck(updateResult.oldProfile),
              textColor: Colors.white,
            ),
            Gap.large(),
            ProgressSummary(
              oldProfile: updateResult.oldProfile,
              updatedProfile: updateResult.updatedProfile,
            ),
            Gap.xxl(),
            PresenceArea(
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
