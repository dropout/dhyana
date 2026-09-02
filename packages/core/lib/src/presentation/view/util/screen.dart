import 'dart:math' as math;
import 'package:core/src/domain/enum/processing_state.dart';
import 'package:core/src/presentation/design_spec.dart';
import 'package:core/src/presentation/view/util/app_button.dart';
import 'package:core/src/presentation/view/util/app_context.dart';
import 'package:material_ui/material_ui.dart';

mixin ScreenHelperMixin {

  Widget buildScaffolding(
    BuildContext context,
    Widget contentLayer,
    {Widget? actionButtonLayer}
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          contentLayer,
          actionButtonLayer ?? Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingXl),
              child: actionButtonLayer,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOverlayActionButton(BuildContext context, ProcessingState state, {
    required VoidCallback onAction,
  }) {
    switch (state) {
      case ProcessingState.idle:
        return AppButton(
          text: context.l10n.profileSaveButtonIdle.toUpperCase(),
          onTap: onAction,
        );
      case ProcessingState.processing:
        return AppButton(
          text: context.l10n.profileSaveButtonSaving.toUpperCase(),
        );
      case ProcessingState.completed:
        return AppButton(
          text: context.l10n.profileSaveButtonSaved.toUpperCase(),
          bColor: Colors.green.shade600,
        );
      case ProcessingState.error:
        return AppButton(
          text: context.l10n.profileSaveButtonIdle.toUpperCase(),
          onTap: onAction,
        );
    }
  }


  double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double screenDiagonal(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return math.sqrt(size.width * size.width + size.height * size.height);
  }

  double wp(BuildContext context, double percent) =>
      screenWidth(context) * (percent / 100);

  double hp(BuildContext context, double percent) =>
      screenHeight(context) * (percent / 100);

  bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  EdgeInsets padding(BuildContext context) => MediaQuery.of(context).padding;

  EdgeInsets viewInsets(BuildContext context) =>
      MediaQuery.of(context).viewInsets;

  double safeHeight(BuildContext context) =>
      screenHeight(context) - padding(context).vertical;

  double shortestSide(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide;

  bool isTablet(BuildContext context, {double threshold = 600}) =>
      shortestSide(context) >= threshold;
}
