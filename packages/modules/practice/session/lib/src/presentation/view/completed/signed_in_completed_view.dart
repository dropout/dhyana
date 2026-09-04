import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:social/social.dart';
import 'package:session/src/domain/entity/session_completed_data_entity.dart';
import 'package:session/src/domain/entity/update_profile_stats_result_entity.dart';
import 'package:session/src/presentation/viewmodel/session_completed/session_completed_cubit.dart';
import 'package:session/src/public/model/session.dart';

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
      onComplete: (UpdateProfileStatsResultEntity updateResult) {
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
    return BlocBuilder<SessionCompletedCubit, SessionCompletedDataEntity>(
      builder: (context, state) {
        switch (state) {
          case SessionCompletedInitialDataEntity():
            return buildLoading(context);
          case SessionCompletedLoadingDataEntity():
            return buildLoading(context);
          case SessionCompletedErrorDataEntity():
            return buildError(context);
          case SessionCompletedSavingDataEntity():
            return buildLoaded(context, state.updateResult);
          case SessionCompletedSavedDataEntity():
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
    UpdateProfileStatsResultEntity updateResult,
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
              PresenceArea.withCubit(
                profileId: updateResult.updatedProfile.id,
                onCubitCreated: (cubit) {
                  cubit.loadPresenceData(
                    ownProfileId: updateResult.updatedProfile.id,
                    limit: 18,
                    windowSize: const Duration(minutes: 120),
                  );
                },
              ),
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
