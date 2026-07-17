import 'package:dhyana/widget/design_spec.dart';
import 'package:flutter/material.dart';

class InsetSurface extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final Color outerColor;
  final Color innerColor;
  final EdgeInsetsGeometry? padding;
  final bool showTopInset;
  final bool showLeftInset;

  const InsetSurface({
    required this.child,
    this.borderRadius = DesignSpec.borderRadiusMd,
    this.borderWidth = 2,
    this.borderColor = Colors.black,
    this.outerColor = AppColors.backgroundPaper,
    this.innerColor = AppColors.backgroundPaperDark,
    this.padding,
    this.showTopInset = true,
    this.showLeftInset = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: outerColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ColoredBox(
                color: innerColor,
                child: padding == null ? child : Padding(padding: padding!, child: child),
              ),
            ),
            if (showTopInset)
              Positioned(
                top: -30,
                left: -30,
                right: -30,
                height: 30,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: borderColor,
                    boxShadow: [
                      BoxShadow(
                        color: borderColor.withValues(alpha: 0.15),
                        blurRadius: 20,
                        offset: const Offset(0, 15),
                      ),
                    ],
                  ),
                ),
              ),
            if (showLeftInset)
              Positioned(
                left: -40,
                top: -40,
                bottom: -40,
                width: 30,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: borderColor,
                    boxShadow: [
                      BoxShadow(
                        color: borderColor.withValues(alpha: 0.15),
                        blurRadius: 20,
                        offset: const Offset(15, 0),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}