import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'models.dart';

class InfoTriggerBars extends StatefulWidget {

  final BarChartContext barChartContext;
  final Color barColor;
  final Color selectedBarColor;

  final Function(int index, BarData data)? onInfoTriggered;
  final Function(int index, BarData data)? onInfoChanged;
  final Function(int index, BarData data)? onInfoDismissed;

  const InfoTriggerBars({
    required this.barChartContext,
    this.barColor = Colors.grey,
    this.selectedBarColor = Colors.white,
    this.onInfoTriggered,
    this.onInfoChanged,
    this.onInfoDismissed,
    super.key,
  });

  @override
  State<InfoTriggerBars> createState() => _InfoTriggerBarsState();
}

class _InfoTriggerBarsState extends State<InfoTriggerBars> {

  final barContainerKey = GlobalKey();
  bool _isInfoTriggered = false;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final barChartData = widget.barChartContext.dataSource;

    return Row(
      key: barContainerKey,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var index = 0; index < barChartData.length; index++)

          Expanded(

            child: GestureDetector(

              onLongPressStart: (details) =>
                handleLongPressStart(context, index, details),

              onLongPressEnd: (_) =>
                handleLongPressEnd(context, index),

              child: Listener(
                behavior: HitTestBehavior.opaque,
                onPointerMove: (PointerMoveEvent event) {
                  int? targetBarIndex = _barHitTest(event.position);
                  if (_isInfoTriggered && targetBarIndex != null && targetBarIndex != selectedIndex) {
                    setState(() {
                      selectedIndex = targetBarIndex;
                    });
                    widget.onInfoChanged?.call(targetBarIndex, barChartData[targetBarIndex]);
                  }
                },
                child: InfoTriggerBar(
                  color: (selectedIndex == index) ? widget.selectedBarColor : widget.barColor,
                  index: index,
                  heightFactor: math.min((barChartData[index].value / widget.barChartContext.displayRange), 1),
                  isSelected: selectedIndex == index,
                ),

              )

            )

          )
      ],
    );
  }

  Widget buildBarArea(BuildContext context) {
    final barChartData = widget.barChartContext.dataSource;
    return Row(
      key: barContainerKey,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var index = 0; index < barChartData.length; index++)

          Expanded(

              child: GestureDetector(

                  onLongPressStart: (details) =>
                      handleLongPressStart(context, index, details),

                  onLongPressEnd: (_) =>
                      handleLongPressEnd(context, index),

                  child: Listener(
                    behavior: HitTestBehavior.opaque,
                    onPointerMove: (PointerMoveEvent event) {
                      int? targetBarIndex = _barHitTest(event.position);
                      if (_isInfoTriggered && targetBarIndex != null && targetBarIndex != selectedIndex) {
                        setState(() {
                          selectedIndex = targetBarIndex;
                        });
                        // widget.onInfoChanged?.call(targetBarIndex, barChartData[targetBarIndex]);
                      }
                    },
                    child: InfoTriggerBar(
                      color: (selectedIndex == index) ? widget.selectedBarColor : widget.barColor,
                      index: index,
                      heightFactor: math.min((barChartData[index].value / widget.barChartContext.displayRange), 1),
                      isSelected: selectedIndex == index,
                    ),
                  )

              )

          )
      ],
    );
  }

  void handleLongPressStart(
      BuildContext context,
      int index,
      LongPressStartDetails details
      ) {
    final box = context.findAncestorRenderObjectOfType<RenderBox>();
    if (box == null) return;

    final hitTestResult = BoxHitTestResult();
    Offset local = box.globalToLocal(details.globalPosition);
    if (box.hitTest(hitTestResult, position: local)) {
      for (final hit in hitTestResult.path) {
        // temporary variable so that the [is] allows access of [index]
        final target = hit.target;
        if (target is RenderInfoTriggerArea) {
          print('target: ${target.localToGlobal(Offset.zero)}');
          // return target.barIndex;
        }
      }
    }

    setState(() {
      _isInfoTriggered = true;
      selectedIndex = index;
      widget.onInfoTriggered?.call(
          index,
          widget.barChartContext.dataSource[index]
      );
    });
  }

  void handleLongPressEnd(BuildContext context, int index) {
    if (_isInfoTriggered) {
      setState(() {
        _isInfoTriggered = false;
        selectedIndex = -1;
        widget.onInfoDismissed?.call(index, widget.barChartContext.dataSource[index]);
      });
    }
  }

  int? _barHitTest(Offset position) {
    if (mounted == false) return null;
    final RenderBox box = barContainerKey.currentContext!.findAncestorRenderObjectOfType<RenderBox>()!;
    final result = BoxHitTestResult();
    Offset local = box.globalToLocal(position);
    if (box.hitTest(result, position: local)) {
      for (final hit in result.path) {
        // temporary variable so that the [is] allows access of [index]
        final target = hit.target;
        if (target is RenderInfoTriggerArea) {
          return target.barIndex;
        }
      }
    }
    return null;
  }

}

class InfoTriggerBar extends StatefulWidget {

  final Color color;
  final int index;
  final double heightFactor;

  final bool isSelected;

  const InfoTriggerBar({
    required this.color,
    required this.index,
    required this.heightFactor,
    this.isSelected = false,
    super.key,
  });

  @override
  State<InfoTriggerBar> createState() => _InfoTriggerBarState();
}

class _InfoTriggerBarState extends State<InfoTriggerBar> {

  @override
  Widget build(BuildContext context) {
    return InfoTriggerArea(
      barIndex: widget.index,
      isSelected: widget.isSelected,
      child: AnimatedFractionallySizedBox(
        duration: Durations.long2,
        curve: Curves.easeInOutCubicEmphasized,
        heightFactor: widget.heightFactor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: AnimatedContainer(
            duration: Durations.short2,
            height: double.infinity,
            decoration: BoxDecoration(
              color: widget.color,
            ),
          ),
        )
      )
    );
  }
}

class InfoTriggerArea extends SingleChildRenderObjectWidget {

  final int barIndex;
  final bool isSelected;

  const InfoTriggerArea({
    required this.barIndex,
    this.isSelected = false,
    super.child,
    super.key,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderInfoTriggerArea(
      barIndex: barIndex,
      isSelected: isSelected,
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderInfoTriggerArea renderObject) {
    renderObject.barIndex = barIndex;
    renderObject.isSelected = isSelected;
  }

}

class RenderInfoTriggerArea extends RenderProxyBox {

  int barIndex;
  bool isSelected;

  RenderInfoTriggerArea({
    required this.barIndex,
    this.isSelected = false,
    RenderBox? child,
  }) : super(child);

  @override
  void performLayout() {
    size = constraints.constrain(Size(double.infinity, double.infinity));
    child?.layout(constraints, parentUsesSize: false);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final RenderBox? child = this.child;
    if (child == null) {
      return;
    }

    // print('isSelected: $isSelected');
    if (isSelected) {
      paintSelectedLine(context.canvas, size, offset);
    }

    context.paintChild(
      child,
      Offset(offset.dx, offset.dy + (size.height - child.size.height)),
    );

  }

  void paintSelectedLine(Canvas canvas, Size size, Offset offset) {
    Paint paint = Paint()
      ..color = Colors.grey.shade500
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(
        offset.dx + size.width / 2 ,
        offset.dy - 16
      ),
      Offset(
        offset.dx + size.width / 2,
        offset.dy + size.height
      ),
      paint,
    );
  }

  @override
  bool hitTestSelf(Offset position) => size.contains(position);

}

class InfoTriggerInfoArea extends StatefulWidget {

  const InfoTriggerInfoArea({super.key});

  @override
  State<InfoTriggerInfoArea> createState() => _InfoTriggerInfoAreaState();
}

class _InfoTriggerInfoAreaState extends State<InfoTriggerInfoArea> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



