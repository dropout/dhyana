import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

import 'gap.dart';

class AppCard extends StatelessWidget {

  final String title;
  final EdgeInsets titlePadding;
  final bool titleGap;
  final EdgeInsets padding;
  final Widget? child;

  const AppCard({
    this.title = '',
    this.child,
    this.titleGap = true,
    this.titlePadding = const EdgeInsets.only(
      top: AppThemeData.paddingLg,
      left: AppThemeData.paddingLg,
      right: AppThemeData.paddingLg,
    ),
    this.padding = const EdgeInsets.only(
      left: AppThemeData.paddingLg,
      right: AppThemeData.paddingLg,
      bottom: AppThemeData.paddingLg,
    ),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundPaperLight,
        borderRadius: BorderRadius.circular(AppThemeData.borderRadiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 0.5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title.isNotEmpty) buildTitle(context, title),
            if (titleGap && title.isNotEmpty) Gap.medium(),
            if (child != null) Padding(
              padding: padding,
              child: child!,
            ),
          ],
        ),
      )
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Padding(
      padding: titlePadding,
      child: Text(title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        softWrap: false,
      ),
    );
  }

}
