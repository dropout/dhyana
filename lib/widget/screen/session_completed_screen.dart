import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/bloc/session_completed/session_completed_cubit.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/session/completed/signed_in_completed_view.dart';
import 'package:dhyana/widget/session/completed/signed_out_completed_view.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            // return AppLoadingDisplay();
            return buildLoaded(context, state);
        }
      },
    );
  }

  Widget buildLoaded(BuildContext context, ProfileLoadedState state) {
    return BlocProvider<SessionCompletedCubit>(
      create: (context) => SessionCompletedCubit(
        profileRepository: context.repos.profileRepository,
        statisticsRepository: context.repos.statisticsRepository,
        idGeneratorService: context.services.idGeneratorService,
        crashlyticsService: context.services.crashlyticsService,
      ),
      child: SignedInCompletedView(
        profileId: state.profile.id,
        session: session,
        profileSettings: state.settings,
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
