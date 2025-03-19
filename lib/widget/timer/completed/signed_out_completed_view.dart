import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:flutter/material.dart';

import 'session_result.dart';

class SignedOutCompletedView extends StatelessWidget {

  final TimerState timerState;

  const SignedOutCompletedView({
    required this.timerState,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SessionResult(
          timerState: timerState
        )
      ],
    );
  }

}
