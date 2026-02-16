import 'package:dhyana/widget/util/app_animation.dart';
import 'package:flutter/material.dart';

class LoginHeadlineTextEffect extends StatefulWidget {

  final String text;
  final TextStyle textStyle;
  final Duration duration;
  final Duration initialDelay;

  const LoginHeadlineTextEffect({
    required this.text,
    required this.textStyle,
    this.duration = const Duration(seconds: 2),
    this.initialDelay = Duration.zero,
    super.key,
  });

  @override
  State<LoginHeadlineTextEffect> createState() => _LoginHeadlineTextEffectState();
}

class _LoginHeadlineTextEffectState extends State<LoginHeadlineTextEffect>
  with SingleTickerProviderStateMixin {

  late final AnimationController animController;
  late final List<Animation<double>> _opacities;
  late final List<_AnimDto> data;

  @override
  void initState() {
    animController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    data = List.generate(widget.text.length, (i) => _AnimDto(
      index: i,
      letter: widget.text[i],
    ));

    final intervalData = calculateIntervals(
      intervalCount: data.length,
      overlapFactor: 0.75,
    );

    _opacities = data.map((item) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animController,
          curve: Interval(
            intervalData.$2[item.index],
            intervalData.$2[item.index] + intervalData.$1,
            curve: Curves.easeIn,
          ),
        ),
      );
    }).toList();

    Future.delayed(widget.initialDelay, () {
      if (mounted) {
        animController.forward();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animController,
      builder: (context, _) {
        return RichText(
          text: TextSpan(
            children: data.map((d) {
              return WidgetSpan(
                child: Opacity(
                  opacity: _opacities[d.index].value,
                  child: Text(
                    d.letter,
                    style: widget.textStyle,
                  )
                ),
              );
            }).toList(),
          )
        );
      },
    );
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

}

class _AnimDto {
  final int index;
  final String letter;

  const _AnimDto({
    required this.index,
    required this.letter,
  }) : assert(letter.length == 1, 'letter must be a single character');

}

