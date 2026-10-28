import 'package:core/src/presentation/design_spec.dart';
import 'package:flutter/widgets.dart';

/// Enforces a maximum width constraint on its child widget and
/// centers it horizontally.
/// Used for ipad and other large screens to prevent content from
/// stretching too wide.
class const MaxwidthConstraints({required final Widget child, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: DesignSpec.maxContentWidth),
      child: child,
    ),
  );
}

class const SliverMaxwidthConstraints({required final Widget sliver, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SliverLayoutBuilder(
    builder: (context, constraints) {
      const double maxWidth = DesignSpec.maxContentWidth;
      final double currentWidth = constraints.crossAxisExtent;

      // Calculate required side padding to center the content
      final double sidePadding = currentWidth > maxWidth
          ? (currentWidth - maxWidth) / 2
          : 0.0;

      return SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: sidePadding),
        sliver: sliver,
      );
    },
  );
}
