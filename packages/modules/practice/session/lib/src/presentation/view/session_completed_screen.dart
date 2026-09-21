import 'package:profile/profile.dart';
import 'package:session/src/presentation/viewmodel/session_completed/session_completed_cubit.dart';
import 'package:session/src/public/model/session.dart';
import 'package:session/src/public/view/signed_in_completed_view.dart';
import 'package:session/src/public/view/signed_out_completed_view.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class const SessionCompletedScreen({
  required final Session session, 
  super.key
}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          SignedIn(
            yes: (_, profileId) => buildProfileCubitState(context, profileId),
            no: SignedOutCompletedView(session: session),
          ),
          CompletedScreenBottomArea(),
        ],
      ),
    );
  }

  Widget buildProfileCubitState(BuildContext context, String profileId) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        switch (state) {
          case ProfileStateInitial():
            return AppLoadingDisplay();
          case ProfileLoadingState():
            return AppLoadingDisplay();
          case ProfileErrorState():
            return AppErrorDisplay();
          case ProfileLoadedState():
            return buildSessionCompletedCubitState(context, state);
        }
      },
    );
  }

  Widget buildSessionCompletedCubitState(BuildContext context, ProfileLoadedState state) {
    return SmartBlocProvider<SessionCompletedCubit, SessionCompletedState>(
      create: (context) => GetIt.I.get<SessionCompletedCubit>(),
      builder: (context, state) {
        switch (state) {
          case SessionCompletedInitialState():
            return const AppLoadingDisplay();
          case SessionCompletedLoadingState():
            return const AppLoadingDisplay();
          case SessionCompletedErrorState():
            return const AppErrorDisplay();
          case SessionCompletedSavingState():
            return SignedInCompletedView(
              profileId: state.updateResult.updatedProfile.id,
              updateResult: state.updateResult,
              profileSettings: state.updateResult.updatedProfile.settings,
            );
          case SessionCompletedSavedState():
            return SignedInCompletedView(
              profileId: state.updateResult.updatedProfile.id,
              updateResult: state.updateResult,
              profileSettings: state.updateResult.updatedProfile.settings,
            );
          default:
            return SizedBox.shrink();
        }
      },
      // child: SignedInCompletedView(
      //   profileId: state.profile.id,
      //   session: session,
      //   profileSettings: state.profile.settings,
      // ),
    );
  }

}

class const CompletedScreenBottomArea({
  super.key  
}) extends StatelessWidget {

  void _onOkayButtonPressed(BuildContext context) {
    context.services.homeNavigator.navigateToHome();
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // can grab scrollable area underneath
          IgnorePointer(
            child: Container(
              height: 160,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.8],
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ]
                )
              )
            ),
          ),
          SafeArea(
            top: false,            
            child: Padding(
              padding: const EdgeInsets.only(bottom: DesignSpec.spacingLg),
              child: AppButton.large(
                key: const Key('session_completed_screen_okay_button'),
                onTap: () => _onOkayButtonPressed(context),
                text: context.coreL10n.okay.toUpperCase(),
                bColor: Colors.white,
                fColor: Colors.black,
              ),
            )
          ),
        ],
      ),
    );
  }
}