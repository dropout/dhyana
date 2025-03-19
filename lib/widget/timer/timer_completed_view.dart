import 'package:dhyana/bloc/session_logger/session_logger_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/timer/completed/signed_in_completed_view.dart';
import 'package:dhyana/widget/timer/completed/signed_out_completed_view.dart';
import 'package:dhyana/widget/util/app_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerCompletedView extends StatelessWidget {

  final TimerSettings timerSettings;
  final TimerState timerState;

  const TimerCompletedView({
    required this.timerSettings,
    required this.timerState,
    super.key,
  });

  void _onOkayButtonPressed(BuildContext context) {
    const HomeRoute().go(context);
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        if (timerState.timerStatus == TimerStatus.completed)
          SignedIn(
            yes: (_, profileId) => buildSignedInView(
              context,
              timerState,
              profileId,
            ),
            no: buildSignedOutView(context, timerState),
          ),
        buildBottomArea(context),
      ],
    );
  }

  Widget buildSignedInView(
    BuildContext context,
    TimerState timerState,
    String profileId,
  ) {
    return BlocProvider<SessionLoggerBloc>(
      create: (context) {
        return SessionLoggerBloc(
          profileRepository: context.repos.profileRepository,
          statisticsRepository: context.repos.statisticsRepository,
          idGeneratorService: context.services.idGeneratorService,
          crashlyticsService: context.services.crashlyticsService,
        );
      },
      child: SignedInCompletedView(
        profileId: profileId,
        timerSettings: timerSettings,
        timerState: timerState,
      ),
    );
  }

  Widget buildSignedOutView(BuildContext context, TimerState timerState) {
    return SignedOutCompletedView(
      timerState: timerState,
    );
  }

  Widget buildBottomArea(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 96,
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
          Padding(
            padding: const EdgeInsets.all(AppThemeData.spacingMd),
            child: AppButton(
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
