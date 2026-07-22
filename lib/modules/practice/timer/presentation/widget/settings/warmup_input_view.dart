import 'dart:async';

import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/modules/practice/timer/presentation/widget/settings/input_view.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

typedef DurationFormatter = String Function(Duration, bool);

class WarmupInputView extends StatefulWidget {
  final int maxMinutes;
  final int minMinutes;
  final int? initialValue;
  final String title;
  final ValueChanged<Duration>? onSelect;
  final Duration preparationTime;
  final bool showStartEndTimes;

  const WarmupInputView({
    this.maxMinutes = 60,
    this.minMinutes = 1,
    this.initialValue,
    this.title = '',
    this.onSelect,
    this.showStartEndTimes = true,
    this.preparationTime = const Duration(minutes: 0),
    super.key,
  });

  @override
  State<WarmupInputView> createState() => _WarmupInputViewState();
}

class _WarmupInputViewState extends State<WarmupInputView>
    with TickerProviderStateMixin {
  late int selectedMinutes;
  Duration elapsedTime = Duration.zero;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    selectedMinutes = widget.initialValue ?? widget.minMinutes;
    // Start a timer that ticks every second to update the start and end times
    if (widget.showStartEndTimes) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          elapsedTime = Duration(seconds: timer.tick);
        });
      });
    }
  }

  @override
  void didUpdateWidget(WarmupInputView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showStartEndTimes && _timer == null) {
      // Start the timer if we didn't have it before
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          elapsedTime = Duration(seconds: timer.tick);
        });
      });
    } else if (!widget.showStartEndTimes && _timer != null) {
      // Cancel the timer if we no longer need it
      _timer?.cancel();
      _timer = null;
    }
  }

  void _onSelectButtonPress(BuildContext context) {
    widget.onSelect?.call(Duration(minutes: selectedMinutes));
  }

  @override
  Widget build(BuildContext context) {
    return InputView(
      title: widget.title,
      onSave: () => _onSelectButtonPress(context),
      child: DecoratedBox(
        decoration: BoxDecoration(color: AppColors.backgroundPaper),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
              left: DesignSpec.paddingLg,
              right: DesignSpec.paddingLg,
              bottom: DesignSpec.padding2Xl,
              top: DesignSpec.paddingMd,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _WarmupTimeOptions(
                  selectedOption: selectedMinutes,
                  onSelect: (minutes) {
                    setState(() {
                      selectedMinutes = minutes;
                      context.services.hapticsService.select();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

// A widget that displays available and selectable warmup times.
class _WarmupTimeOptions extends StatelessWidget {
  final int? selectedOption;
  final ValueChanged<int> onSelect;

  const _WarmupTimeOptions({required this.onSelect, this.selectedOption});

  @override
  Widget build(BuildContext context) {
    final columnCount = 2;

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth =
            (constraints.maxWidth - DesignSpec.paddingLg * (columnCount - 1)) /
            columnCount;
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: _WarmupTimeOptionItem(
                minutes: 0,
                isSelected: selectedOption == 0,
                onTap: () => onSelect(0),
              ),
            ),
            Gap.medium(),
            Row(
              spacing: DesignSpec.paddingLg,
              children: [
                SizedBox(
                  width: itemWidth,
                  child: _WarmupTimeOptionItem(
                    minutes: 1,
                    isSelected: selectedOption == 1,
                    onTap: () => onSelect(1),
                  ),
                ),
                SizedBox(
                  width: itemWidth,
                  child: _WarmupTimeOptionItem(
                    minutes: 2,
                    isSelected: selectedOption == 2,
                    onTap: () => onSelect(2),
                  ),
                ),
              ],
            ),
            Gap.medium(),
            Row(
              spacing: DesignSpec.paddingLg,
              children: [
                SizedBox(
                  width: itemWidth,
                  child: _WarmupTimeOptionItem(
                    minutes: 3,
                    isSelected: selectedOption == 3,
                    onTap: () => onSelect(3),
                  ),
                ),
                SizedBox(
                  width: itemWidth,
                  child: _WarmupTimeOptionItem(
                    minutes: 5,
                    isSelected: selectedOption == 5,
                    onTap: () => onSelect(5),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _WarmupTimeOptionItem extends StatelessWidget {
  final int minutes;
  final bool isSelected;
  final VoidCallback onTap;

  const _WarmupTimeOptionItem({
    required this.minutes,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected
        ? Colors.black
        : AppColors.backgroundPaperLight;

    final textColor = isSelected
        ? AppColors.gold
        : Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: TweenAnimationBuilder(
        tween: ColorTween(begin: backgroundColor, end: backgroundColor),
        duration: const Duration(milliseconds: 300),
        builder: (context, color, child) {
          return Stack(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(DesignSpec.borderRadiusLg),
                  boxShadow: DesignSpec.defaultBoxShadow,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: DesignSpec.paddingMd,
                    horizontal: DesignSpec.paddingLg,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          minutes.toString(),
                          style: context.theme.textTheme.displayMedium
                              ?.copyWith(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          context.l10n.minutesPlural(minutes),
                          style: context.theme.textTheme.bodyLarge?.copyWith(
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // If this option is selected, show a checkmark in the top right corner
              Positioned(
                top: DesignSpec.paddingMd,
                right: DesignSpec.paddingMd,
                child: AnimatedOpacity(
                  opacity: isSelected ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(Icons.check_circle, color: textColor, size: 24),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
