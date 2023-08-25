import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/widgets/timer/completed/signed_in_view.dart';
import 'package:dhyana/widgets/timer/completed/signed_out_view.dart';
import 'package:dhyana/widgets/util/app_button.dart';
import 'package:dhyana/widgets/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/route/all.dart';
import 'package:dhyana/widgets/app_theme_data.dart';

import '../../bloc/sessions/sessions_bloc.dart';

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
    context.goNamed(AppScreen.home.name);
  }

  void _addSession(BuildContext context, User user, TimerState state) {
    SessionsBloc sessionsBloc = BlocProvider.of<SessionsBloc>(context);
    sessionsBloc.add(
      SessionsEvent.addSession(
        profileId: user.uid,
        startTime: state.startTime!,
        endTime: state.endTime!,
        timerSettings: state.timerSettings,
      )
    );
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
      children: [
        SingleChildScrollView(
          child: SignedIn(
            yes: (BuildContext context, User user) {
              return SignedInView(
                onInit: () => _addSession(context, user, widget.timerState),
                timerState: widget.timerState,
                user: user,
              );
            },
            no: SignedOutView(
              timerState: widget.timerState,
            )
          ),
        ),
        _buildBuyButton(context),
      ],
    );
  }

  Widget _buildBuyButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
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
              text: AppLocalizations.of(context).okay.toUpperCase(),
              bColor: Colors.white,
              fColor: Colors.black,
              onTap: () => _onOkayButtonPressed(context),
            ),
          ),
        ],
      ),
    );
  }

}
