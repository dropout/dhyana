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

class TimerCompletedView extends StatefulWidget {

  final TimerState timerState;

  const TimerCompletedView({
    required this.timerState,
    super.key,
  });

  @override
  State<TimerCompletedView> createState() => _TimerCompletedViewState();
}

class _TimerCompletedViewState extends State<TimerCompletedView> {

  @override
  void initState() {
    super.initState();
  }

  void _onOkayButtonPressed(BuildContext context) {
    const HomeRoute().go(context);
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {

    // Only create widgets below the tree when
    // timer is completed, initialization of those widgets
    // fire important events to record sessions
    if (widget.timerState.timerStatus != TimerStatus.completed) {
      return const SizedBox.shrink();
    }

    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        SingleChildScrollView(
          child: SignedIn(
            yes: (_, __) {
              return SignedInCompletedView(
                timerState: widget.timerState,
              );
            },
            no: SignedOutCompletedView(
              timerState: widget.timerState,
            )
          ),
        ),
        buildBottomArea(context),
      ],
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
