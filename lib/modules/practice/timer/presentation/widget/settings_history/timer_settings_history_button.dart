import 'package:dhyana/core/navigation/app_routes.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/util/app_context.dart';
import 'package:flutter/material.dart';

class TimerSettingsHistoryButton extends StatelessWidget {

  final String profileId;

  const TimerSettingsHistoryButton({
    required this.profileId,
    super.key
  });

  void _onButtonTap(BuildContext context) {
    TimerSettingsHistoryRoute(profileId: profileId).push(context);
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      shape: const CircleBorder(),

      onPressed: () => _onButtonTap(context),
      constraints: const BoxConstraints(),
      fillColor: AppColors.buttonBackground,
      child: const SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.only(
            right: 2.0, // it's hard to center an icon in circle
          ),
          child: Icon(Icons.history,
            color: AppColors.buttonForeground,
            size: 24,
          ),
        ),
      ),
    );
  }

}
