import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {

  final String title;
  final List<Widget> children;

  const AppCard({
    this.title = '',
    this.children = const [],
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
        child: Padding(
          padding: const EdgeInsets.all(AppThemeData.paddingLg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title.isNotEmpty) Text(title, style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.bold,
              )),
              ...children,
            ],
          ),
        ),
      )
    );
  }

}
