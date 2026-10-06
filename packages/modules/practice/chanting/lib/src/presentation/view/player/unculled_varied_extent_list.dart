import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// A [SliverVariedExtentList] that paints every built child.
///
/// The stock sliver skips children whose layout position is outside the
/// viewport, which hides children that a paint-time transform (the worm
/// effect) has moved back on screen. The viewport still clips the overflow.

/// The worm effect jumps the real scroll offset, then visually offsets each
/// line with a paint-time transform to fake the scroll. The stock sliver culls
/// painting by layout position, so a line that was near the top edge is laid
/// out above the viewport after the jump and is skipped, even though its
/// transform would still show it on screen. It then vanishes instead of
/// scrolling out. Painting every built child avoids this, and the viewport
/// still clips what is off-screen.

class UnculledSliverVariedExtentList extends SliverVariedExtentList {
  const UnculledSliverVariedExtentList({
    super.key,
    required super.delegate,
    required super.itemExtentBuilder,
  });

  @override
  RenderSliverVariedExtentList createRenderObject(BuildContext context) {
    return _RenderUnculledSliverVariedExtentList(
      childManager: context as SliverMultiBoxAdaptorElement,
      itemExtentBuilder: itemExtentBuilder,
    );
  }
}

class _RenderUnculledSliverVariedExtentList
    extends RenderSliverVariedExtentList {
  _RenderUnculledSliverVariedExtentList({
    required super.childManager,
    required super.itemExtentBuilder,
  });

  @override
  void paint(PaintingContext context, Offset offset) {
    // Vertical, non-reversed lists only, which is all the lyrics view uses.
    assert(constraints.axis == Axis.vertical);
    assert(constraints.axisDirection == AxisDirection.down);
    assert(constraints.growthDirection == GrowthDirection.forward);

    RenderBox? child = firstChild;
    while (child != null) {
      context.paintChild(
        child,
        offset +
            Offset(
              childCrossAxisPosition(child),
              childMainAxisPosition(child),
            ),
      );
      child = childAfter(child);
    }
  }
}


