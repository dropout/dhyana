import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatefulWidget {
  const CustomBackButton({super.key});

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
    context.pop();
  }

  void _onTapDown(BuildContext context) {
    animController.reset();
    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      onTapDown: (_) => _onTapDown(context),
      child: SizedBox.square(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: ClipOval(
            child: AnimatedBuilder(
              animation: animController,
              builder: (BuildContext context, Widget? child) {
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment(alignmentAnimation.value, 0.0),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
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
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

}
