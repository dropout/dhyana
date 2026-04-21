import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';

class PresenceButton extends StatelessWidget {

  const PresenceButton({
    super.key
  });

  void _onButtonTap(BuildContext context) {
    const PresenceRoute().push(context);
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
      fillColor: Colors.black,
      child: const SizedBox.expand(
        child: Icon(Icons.public_rounded,
          color: AppColors.backgroundPaperLight,
          size: 24,
        ),
      ),
    );
  }

}
