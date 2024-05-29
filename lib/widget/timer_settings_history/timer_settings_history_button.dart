import 'package:dhyana/route/app_screen.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TimerSettingsHistoryButton extends StatelessWidget {

  const TimerSettingsHistoryButton({super.key});

  void _onButtonTap(BuildContext context, String profileId) {
    context.pushNamed(
      AppScreen.timerSettingsHistory.name,
      pathParameters: {
        'profileId': profileId,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SignedIn(
      yes: (context, user) {
        return GestureDetector(
          onTap: () => _onButtonTap(context, user.uid),
          child: const Icon(
            Icons.history,
            size: 40.0,
            color: Colors.black,
          ),
        );
      },
    );

  }

}
