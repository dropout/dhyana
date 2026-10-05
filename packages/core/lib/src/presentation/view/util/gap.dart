import 'package:core/src/presentation/design_spec.dart';
import 'package:material_ui/material_ui.dart';


class Gap extends StatelessWidget {
  const Gap({required this.size, super.key});

  final double size;

  factory Gap.xxs() => const Gap(size: DesignSpec.spacingXxs);
  factory Gap.xs() => const Gap(size: DesignSpec.spacingXs);
  factory Gap.small() => const Gap(size: DesignSpec.spacingSm);
  factory Gap.medium() => const Gap(size: DesignSpec.spacingMd);
  factory Gap.large() => const Gap(size: DesignSpec.spacingLg);
  factory Gap.xl() => const Gap(size: DesignSpec.spacingXl);
  factory Gap.xxl() => const Gap(size: DesignSpec.spacing2xl);

  // Grows to fill available space up to `size`, unlike the fixed variants above.
  static Widget flexible({required double size, int flex = 1}) => Flexible(
        fit: FlexFit.loose,
        flex: flex,
        child: Gap(size: size),
      );

  @override
  Widget build(BuildContext context) => SizedBox.square(dimension: size);
}
