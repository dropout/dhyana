import 'dart:math' as math;
import 'package:dhyana/enum/loading_state.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: AppThemeData.paddingXl),
              child: actionButtonLayer,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOverlayActionButton(BuildContext context, LoadingState state, {
    required VoidCallback onAction,
  }) {
    switch (state) {
      case LoadingState.idle:
        return AppButton(
          text: context.localizations.profileSaveButtonIdle.toUpperCase(),
          onTap: onAction,
        );
      case LoadingState.loading:
        return AppButton(
          text: context.localizations.profileSaveButtonSaving.toUpperCase(),
        );
      case LoadingState.loaded:
        return AppButton(
          text: context.localizations.profileSaveButtonSaved.toUpperCase(),
          bColor: Colors.green.shade600,
        );
      case LoadingState.error:
        return AppButton(
          text: context.localizations.profileSaveButtonIdle.toUpperCase(),
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
