import 'package:dhyana/route/app_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TimerSettingsHistoryButton extends StatelessWidget {

  const TimerSettingsHistoryButton({super.key});

  void _onButtonTap(BuildContext context) {
    context.pushNamed(AppScreen.timerSettingsHistory.name);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onButtonTap(context),
      child: Icon(
        Icons.history,
        size: 40.0,
        color: Colors.black,
      ),
    );
  }

}
