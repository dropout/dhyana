import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:flutter/material.dart';

import 'session_result.dart';

class SignedOutView extends StatefulWidget {

  final TimerState timerState;

  const SignedOutView({
    required this.timerState,
    super.key
  });

  @override
  State<SignedOutView> createState() => _SignedOutViewState();
}

class _SignedOutViewState extends State<SignedOutView> {
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
