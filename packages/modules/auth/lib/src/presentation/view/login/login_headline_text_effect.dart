import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';

class const LoginHeadlineTextEffect({
  required final String text,
  required final TextStyle textStyle,
  final Duration duration = const Duration(seconds: 2),
  final Duration initialDelay = Duration.zero,
  super.key,
}) extends StatefulWidget {
  @override
  State<LoginHeadlineTextEffect> createState() =>
    _LoginHeadlineTextEffectState();
}

class _LoginHeadlineTextEffectState extends State<LoginHeadlineTextEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController animController;
  late final List<Animation<double>> _opacities;
  late final List<_AnimDto> data;

  @override
  void initState() {
    super.initState();

    animController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    data = List.generate(
      widget.text.length,
      (i) => _AnimDto(index: i, letter: widget.text[i]),
    );

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
                  child: Text(d.letter, style: widget.textStyle),
                ),
              );
            }).toList(),
          ),
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

  const _AnimDto({required this.index, required this.letter})
    : assert(letter.length == 1, 'letter must be a single character');
}
