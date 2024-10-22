import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

class Gap extends StatelessWidget {

  final double size;

  const Gap({
    required this.size,
    super.key
  });

  factory Gap.xxs() =>
      const Gap(size: AppThemeData.spacingXxs);

  factory Gap.xs() =>
      const Gap(size: AppThemeData.spacingXs);

  factory Gap.small() =>
      const Gap(size: AppThemeData.spacingSm);

  factory Gap.medium() =>
      const Gap(size: AppThemeData.spacingMd);

  factory Gap.large() =>
      const Gap(size: AppThemeData.spacingLg);

  factory Gap.xl() =>
      const Gap(size: AppThemeData.spacingXl);

  factory Gap.xxl() =>
      const Gap(size: AppThemeData.spacing2xl);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(dimension: size);
  }
}
