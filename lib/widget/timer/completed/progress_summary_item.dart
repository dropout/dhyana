import 'package:dhyana/util/localization.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flip_board/flip_widget.dart';
import 'package:flutter/material.dart';

class ProgressSummaryItem extends StatefulWidget {

  final String label;
  final int oldValue;
  final int newValue;
  final Duration animationDelay;

  const ProgressSummaryItem({
    required this.oldValue,
    required this.newValue,
    required this.label,
    this.animationDelay = Duration.zero,
    super.key
  });

  @override
  State<ProgressSummaryItem> createState() => _ProgressSummaryItemState();
}

class _ProgressSummaryItemState extends State<ProgressSummaryItem>
with SingleTickerProviderStateMixin {

  late final AnimationController animationController;
  late final Animation<double> showAnimation;
  late final Animation<double> hideAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Durations.medium4,
    );

    showAnimation = Tween<double>(
      begin: 0.0, end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastEaseInToSlowEaseOut,
    ));

    hideAnimation = Tween<double>(
      begin: 0.0, end: 1.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastEaseInToSlowEaseOut,
    ));

    if (widget.newValue != widget.oldValue) {
      animationController.forward();

      // show
      Future.delayed(widget.animationDelay, () {
        animationController.forward();
      });

      // hide
      Future.delayed(widget.animationDelay + Duration(seconds: 3), () {
        animationController.reverse();
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String old = getLocalizedRoundedNumber(
      context,
      widget.oldValue,
      shorten: true
    );
    String newVal = getLocalizedRoundedNumber(
      context,
      widget.newValue,
      shorten: true
    );

    return Stack(
      children: [
        buildDiffIndicator(context),
        Padding(
          padding: const EdgeInsets.all(AppThemeData.paddingMd),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              FlipWidget(
                flipType: FlipType.spinFlip,
                itemStream: Stream.fromIterable([newVal]),
                itemBuilder: buildItem,
                initialValue: old,
                flipDirection: AxisDirection.up,
              ),
              const SizedBox(height: 8),
              Text(
                widget.label.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                )
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildItem(BuildContext context, String? value) {
    return Center(
      child: Text(
        value ?? '',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildDiffIndicator(BuildContext context) {
    if (widget.newValue != widget.oldValue) {
      return Align(
          alignment: Alignment.topRight,
          child: Transform.translate(
              offset: Offset(0, -AppThemeData.spacingXs),
              child: AnimatedBuilder(
                animation: animationController.isForwardOrCompleted ?
                showAnimation : hideAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: animationController.isForwardOrCompleted ?
                    showAnimation.value : hideAnimation.value,
                    child: DecoratedBox(
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: Colors.green,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppThemeData.paddingSm,
                            vertical: AppThemeData.paddingXs
                        ),
                        child: Text(
                          '+${widget.newValue - widget.oldValue}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                      ),
                    ),
                  );
                },
              )
          )
      );
    } else {
      return SizedBox.shrink();
    }
  }

}
