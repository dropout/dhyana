import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:flutter/material.dart';

import 'session_result.dart';

class SignedOutCompletedView extends StatefulWidget {

  final TimerState timerState;

  const SignedOutCompletedView({
    required this.timerState,
    super.key
  });

  @override
  State<SignedOutCompletedView> createState() => _SignedOutCompletedViewState();
}

class _SignedOutCompletedViewState extends State<SignedOutCompletedView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SessionResult(
          timerState: widget.timerState
        )
      ],
    );
  }
}
