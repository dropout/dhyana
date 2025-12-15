import 'package:dhyana/widget/design_spec.dart';
import 'package:flutter/material.dart';

class Gap extends StatelessWidget {

  final double size;

  const Gap({
    required this.size,
    super.key
  });

  factory Gap.xxs() =>
      const Gap(size: DesignSpec.spacingXxs);

  factory Gap.xs() =>
      const Gap(size: DesignSpec.spacingXs);

  factory Gap.small() =>
      const Gap(size: DesignSpec.spacingSm);

  factory Gap.medium() =>
      const Gap(size: DesignSpec.spacingMd);

  factory Gap.large() =>
      const Gap(size: DesignSpec.spacingLg);

  factory Gap.xl() =>
      const Gap(size: DesignSpec.spacingXl);

  factory Gap.xxl() =>
      const Gap(size: DesignSpec.spacing2xl);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(dimension: size);
  }
}
