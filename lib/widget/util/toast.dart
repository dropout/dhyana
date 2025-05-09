import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

import 'gap.dart';

OverlayEntry? _overlayEntry;

extension ToastMixin on BuildContext {

  void showSuccessfulToast(String message) {
    final overlay = Overlay.of(this);
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return CustomSingleChildLayout(
          delegate: ToastLayoutDelegate(),
          child: Toast(
            message: message,
            onFinished: () {
              _overlayEntry?.remove();
              _overlayEntry = null;
            },
          ),
        );
      }
    );
    overlay.insert(_overlayEntry!);
  }

}


class Toast extends StatefulWidget {

  final String message;
  final IconData icon;
  final Color foregroundColor;
  final Color backgroundColor;
  final Duration duration;
  final VoidCallback? onFinished;

  const Toast({
    required this.message,
    this.icon = Icons.check_circle,
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.green,
    this.duration = const Duration(seconds: 2),
    this.onFinished,
    super.key
  });

  @override
  State<Toast> createState() => _ToastState();

}

class _ToastState extends State<Toast>
  with SingleTickerProviderStateMixin {

  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Durations.short4,
    );
    _controller.forward();

    Future.delayed(widget.duration, () {
      _controller.reverse().then((_) {
        widget.onFinished?.call();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _controller.value,
          child: child,
        );
      },
      child: Material(
        color: Colors.green,
        shape: StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppThemeData.paddingLg,
            vertical: AppThemeData.paddingMd,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon,
                color: widget.foregroundColor,
              ),
              Gap.small(),
              Text(
                widget.message,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: widget.foregroundColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

}

class ToastLayoutDelegate extends SingleChildLayoutDelegate {

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(
      maxWidth: constraints.maxWidth - AppThemeData.paddingLg * 2,
      maxHeight: constraints.maxHeight - AppThemeData.paddingLg * 2,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(
      size.width / 2 - childSize.width / 2,
      kToolbarHeight + AppThemeData.spacingSm,
    );
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return false;
  }

}

