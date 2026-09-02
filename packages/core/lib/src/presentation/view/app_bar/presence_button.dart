import 'package:core/src/presentation/design_spec.dart';
import 'package:core/src/presentation/view/util/app_context.dart';
import 'package:material_ui/material_ui.dart';

class PresenceButton extends StatelessWidget {

  const PresenceButton({
    super.key
  });

  void _onButtonTap(BuildContext context) {
    context.services.socialNavigator.navigateToPresence();
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
        child: Icon(Icons.public_rounded,
          color: AppColors.buttonForeground,
          size: 24,
        ),
      ),
    );
  }

}
