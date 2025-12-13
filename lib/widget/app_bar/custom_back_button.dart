import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatefulWidget {

  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomBackButton({
    this.backgroundColor,
    this.foregroundColor,
    super.key,
  });

  factory CustomBackButton.light() =>
    const CustomBackButton(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );

  factory CustomBackButton.dark() =>
    const CustomBackButton(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    );

  @override
  State<CustomBackButton> createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton>
  with SingleTickerProviderStateMixin {

  late final AnimationController animController;
  late final TweenSequence<double> tweenSequence;
  late final Animation<double> alignmentAnimation;

  @override
  void initState() {
    animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 512),
    );

    tweenSequence = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 0,
          end: -3.0,
        ).chain(CurveTween(curve: Curves.easeInQuad)),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 3.0,
          end: 0.0,
        ).chain(CurveTween(curve: Curves.easeOutQuad)),
        weight: 50.0,
      ),
    ]);

    alignmentAnimation = tweenSequence.animate(
      CurvedAnimation(
        parent: animController,
        curve: Curves.linear,
      )
    );

    super.initState();
  }

  void _onTap(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      const HomeRoute().go(context);
    }
  }

  void _onTapDown(BuildContext context) {
    animController.reset();
    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.backgroundColor ?? Colors.black;
    final foregroundColor = widget.foregroundColor ?? Colors.white;

    return RepaintBoundary(
      child: GestureDetector(
        onTap: () => _onTap(context),
        onTapDown: (_) => _onTapDown(context),
        child: SizedBox.square(
          dimension: 48,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: Color.lerp(backgroundColor, Colors.white, 0.33)!,
                width: 2.0,
              ),
            ),
            child: ClipOval(
              child: AnimatedBuilder(
                animation: animController,
                builder: (BuildContext context, Widget? child) {
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment(alignmentAnimation.value, 0.0),
                        child: Icon(
                          Icons.arrow_back,
                          color: foregroundColor,
                          size: AppThemeData.spacingLg,
                        )
                      ),
                    ]
                  );
                },
              ),
            ),
          )
        ),
      ),
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

}

