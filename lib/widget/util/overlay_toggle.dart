import 'package:flutter/material.dart';

class OverlayToggle extends StatefulWidget {

  final Color overlayColor;
  final Widget? child;

  const OverlayToggle({
    required this.child,
    this.overlayColor = Colors.black,
    super.key,
  });

  @override
  State<OverlayToggle> createState() => _OverlayToggleState();
}

class _OverlayToggleState extends State<OverlayToggle> {

  bool showOverlay = false;

  void _onShowOverlayClickTargetTapped() {
    setState(() {
      showOverlay = true;
    });
  }

  void _onOverlayTapped() {
    setState(() {
      showOverlay = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        buildShowOverlayClickTarget(context),
        widget.child ?? const SizedBox.shrink(),
        buildOverlay(context),
      ]
    );
  }

  Widget buildShowOverlayClickTarget(BuildContext context) {
    return GestureDetector(
      key: const Key('overlay_toggle_click_target'),
      onTap: _onShowOverlayClickTargetTapped,
      child: SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }

  Widget buildOverlay(BuildContext context) {
    return GestureDetector(
      key: const Key('overlay_toggle_overlay'),
      onTap: _onOverlayTapped,
      child: SizedBox.expand(
        child: IgnorePointer(
          ignoring: (showOverlay == false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1024),
            curve: Curves.fastEaseInToSlowEaseOut,
            width: double.infinity,
            height: double.infinity,
            color: showOverlay ? widget.overlayColor : Colors.transparent,
          ),
        )

        // child: DecoratedBox(
        //   decoration: BoxDecoration(
        //     color: widget.overlayColor,
        //   ),
        // ),
      ),
    );
  }
}
