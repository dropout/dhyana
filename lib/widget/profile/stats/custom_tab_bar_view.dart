import 'package:flutter/material.dart';


class CustomTabBarView extends StatefulWidget {
  final List<Widget> children;
  final Duration duration;
  final Curve switchInCurve;
  final Curve switchOutCurve;
  final TabController tabController;

  const CustomTabBarView({
    required this.children,
    required this.tabController,
    this.duration = const Duration(milliseconds: 300),
    this.switchInCurve = Curves.linear,
    this.switchOutCurve = Curves.linear,
    super.key,
  });

  @override
  State<CustomTabBarView> createState() => _CustomTabBarViewState();
}

enum _AnimationDirection {
  left,
  right,
}

class _CustomTabBarViewState extends State<CustomTabBarView> {

  int lastIndex = 0;
  _AnimationDirection animationDirection = _AnimationDirection.right;

  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    setState(() {
      if (widget.tabController.index > lastIndex) {
        animationDirection = _AnimationDirection.right;
      } else {
        animationDirection = _AnimationDirection.left;
      }
      lastIndex = widget.tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedSwitcher(
          duration: widget.duration,
          switchInCurve: widget.switchInCurve,
          switchOutCurve: widget.switchOutCurve,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          child: widget.children[widget.tabController.index],
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_onTabChanged);
    super.dispose();
  }

}
