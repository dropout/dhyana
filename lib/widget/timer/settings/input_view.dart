import 'package:flutter/material.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_button.dart';

class InputView extends StatelessWidget {

  final Widget child;
  final String title;
  final VoidCallback? onSave;
  final bool wrapContentWithExpandedWidget;

  const InputView({
    required this.title,
    required this.child,
    required this.onSave,
    this.wrapContentWithExpandedWidget = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildAppBar(context),
        DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.backgroundPaper,
          ),
          child: SafeArea(
            child: Column(
              // button width match its parent width
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildContent(context),
                buildActionButtons(context),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildAppBar(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppThemeData.borderRadiusLg),
        topRight: Radius.circular(AppThemeData.borderRadiusLg),
      ),
      child: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          )
        ),
        automaticallyImplyLeading: false,
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return child;
  }

  Widget buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppThemeData.spacingMd),
      child: AppButton(
        text: AppLocalizations.of(context).okay.toUpperCase(),
        onTap: () => onSave?.call(),
      ),
    );
  }

}
