import 'package:dhyana/core/core_routes.dart';
import 'package:dhyana/modules/profile/presentation/viewmodel/profile/profile_cubit.dart';
import 'package:dhyana/modules/practice/session/presentation/viewmodel/session_completed/session_completed_cubit.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/signed_in_completed_view.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/signed_out_completed_view.dart';
import 'package:dhyana/core/presentation/view/util/app_button.dart';
import 'package:dhyana/core/presentation/view/util/app_context.dart';
import 'package:dhyana/core/presentation/view/util/app_error_display.dart';
import 'package:dhyana/core/presentation/view/util/app_loading_display.dart';
import 'package:dhyana/core/presentation/view/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SessionCompletedScreen extends StatelessWidget {

  final Session session;

  const SessionCompletedScreen({
    required this.session,
    super.key
  });

  void _onOkayButtonPressed(BuildContext context) {
    const HomeRoute().go(context);
    context.hapticsTap();
  }

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
            yes: (_, profileId) => buildSignedInView(context, profileId),
            no: SignedOutCompletedView(session: session),
          ),
          buildBottomArea(context),
        ],
      ),
    );
  }

  Widget buildSignedInView(BuildContext context, String profileId) {
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
            return buildLoaded(context, state);
        }
      },
    );
  }

  Widget buildLoaded(BuildContext context, ProfileLoadedState state) {
    return BlocProvider<SessionCompletedCubit>(
      create: (context) => GetIt.instance.get<SessionCompletedCubit>(),
      child: SignedInCompletedView(
        profileId: state.profile.id,
        session: session,
        profileSettings: state.profile.settings,
      ),
    );
  }

  Widget buildBottomArea(BuildContext context) {
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
            child: AppButton(
              key: const Key('session_completed_screen_okay_button'),
              onTap: () => _onOkayButtonPressed(context),
              text: AppLocalizations.of(context).okay.toUpperCase(),
              bColor: Colors.white,
              fColor: Colors.black,
            )
          ),
        ],
      ),
    );
  }

}
