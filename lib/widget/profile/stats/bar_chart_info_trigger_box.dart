import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';


class BarChartInfoTriggerBox extends StatelessWidget {

  final Widget prefix;
  final Widget mainText;
  final Widget postfix;

  const BarChartInfoTriggerBox({
    required this.prefix,
    required this.mainText,
    required this.postfix,
    super.key,
  });

  factory BarChartInfoTriggerBox.withText({
    required String prefix,
    required String mainText,
    required String postfix,
  }) {
    return BarChartInfoTriggerBox(
      prefix: Text(prefix),
      mainText: Text(mainText),
      postfix: Text(postfix),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = AppColors.backgroundPaperLight;

    return Theme(
      data: Theme.of(context).copyWith(
        iconTheme: Theme.of(context).iconTheme.copyWith(
          color: Colors.black,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade500,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(AppThemeData.borderRadiusSm),
          color: Colors.grey.shade900,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppThemeData.paddingMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              DefaultTextStyle(
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
                child: prefix,
              ),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
                child: mainText,
              ),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
                child: postfix,
              ),
            ],
          ),
        ),
      ),
    );

  }
}
