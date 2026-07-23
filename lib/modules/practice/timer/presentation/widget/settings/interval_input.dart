import 'package:dhyana/service/overlay_service.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/modules/practice/timer/presentation/widget/settings/input_view.dart';
import 'package:dhyana/modules/practice/timer/presentation/widget/settings/input_button.dart';
import 'package:dhyana/core/presentation/widget/util/app_context.dart';
import 'package:dhyana/core/presentation/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A widget that allows users to select how many times the interval sound
/// should play during a timer session.
class IntervalInput extends StatelessWidget {
  /// Label used for input view title.
  final String label;

  /// The selected interval count value.
  final int value;

  /// Minimum selectable interval count. Default is 0.
  final int minCount;

  /// Maximum selectable interval count. Default is 3.
  final int maxCount;

  /// Callback function called when the value changes.
  final ValueChanged<int>? onChange;

  /// The service used to manage overlays, such as showing modal bottom sheets.
  final OverlayService overlayService;

  const IntervalInput({
    required this.label,
    required this.value,
    required this.overlayService,
    this.minCount = 0,
    this.maxCount = 3,
    this.onChange,
    super.key,
  });

  void _onSelected(BuildContext context, int intervalCount) {
    onChange?.call(intervalCount);
    context.hapticsTap();
    context.pop();
  }

  void _onInputTap(BuildContext context) {
    overlayService.showModalBottomSheet(
      context,
      (context) => _IntervalInputView(
        title: label,
        initialValue: value,
        minCount: minCount,
        maxCount: maxCount,
        onSelect: (intervalCount) => _onSelected(context, intervalCount),
      ),
      enableDrag: false,
    );
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return InputButton(
      key: const Key('timer_interval_input_button'),
      onTap: () => _onInputTap(context),
      padding: const EdgeInsets.symmetric(
        horizontal: DesignSpec.spacingMd,
        vertical: DesignSpec.spacingSm,
      ),
      shape: const StadiumBorder(side: BorderSide.none),
      child: Text(
        value == 0
            ? context.l10n.noInterval
            : context.l10n.intervalPluralWithNumber(value),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.buttonForeground,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _IntervalInputView extends StatefulWidget {
  final int maxCount;
  final int minCount;
  final int? initialValue;
  final String title;
  final ValueChanged<int>? onSelect;

  const _IntervalInputView({
    this.maxCount = 3,
    this.minCount = 0,
    this.initialValue,
    this.title = '',
    this.onSelect,
  });

  @override
  State<_IntervalInputView> createState() => _IntervalInputViewState();
}

class _IntervalInputViewState extends State<_IntervalInputView> {
  late int selectedCount;

  @override
  void initState() {
    super.initState();
    selectedCount = (widget.initialValue ?? widget.minCount).clamp(
      widget.minCount,
      widget.maxCount,
    );
  }

  void _onSelectButtonPress() {
    widget.onSelect?.call(selectedCount);
  }

  void _onOptionSelected(BuildContext context, int newValue) {
    setState(() {
      selectedCount = newValue;
    });
    context.services.hapticsService.select();
  }

  @override
  Widget build(BuildContext context) {
    final options = List<int>.generate(
      widget.maxCount - widget.minCount + 1,
      (index) => widget.minCount + index,
    );

    return InputView(
      title: widget.title,
      onSave: _onSelectButtonPress,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.backgroundPaper,
          borderRadius: BorderRadius.circular(DesignSpec.borderRadiusLg),
        ),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomToggleButton(
                  options: options,
                  selectedValue: selectedCount,
                  onChanged: (newValue) => _onOptionSelected(context, newValue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }  
}

// A custom toggle button widget that allows specific behaviour and styling
// for the interval count selection.
class CustomToggleButton extends StatelessWidget {
  final List<int> options;
  final int selectedValue;
  final ValueChanged<int> onChanged;

  const CustomToggleButton({
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final columnCount = 2;

    return LayoutBuilder(
      builder: (context, constraints) {
        final gridItemWidth =
            (constraints.maxWidth / columnCount) -
            DesignSpec.spacingMd / 2; // Calculate width for each item
        final gridItemHeight = 160.0; // Fixed height for each item

        return Column(
          children: [
            Row(
              spacing: DesignSpec.spacingMd,
              children: [
                SizedBox(
                  width: gridItemWidth,
                  height: gridItemHeight,
                  child: CustomToggleButtonItem(
                    intervalCount: 0,
                    title: context.l10n.noInterval,
                    text: context.l10n.intervalNoIntervalsText,
                    isSelected: selectedValue == 0,
                    onTap: () => onChanged(0),
                  ),
                ),
                SizedBox(
                  width: gridItemWidth,
                  height: gridItemHeight,
                  child: CustomToggleButtonItem(
                    intervalCount: 1,
                    title: context.l10n.intervalPluralWithNumber(1),
                    text: context.l10n.intervalOneIntervalText,
                    isSelected: selectedValue == 1,
                    onTap: () => onChanged(1),
                  ),
                ),
              ],
            ),
            Gap.medium(),
            Row(
              spacing: DesignSpec.spacingMd,
              children: [
                SizedBox(
                  width: gridItemWidth,
                  height: gridItemHeight,
                  child: CustomToggleButtonItem(
                    intervalCount: 2,
                    title: context.l10n.intervalPluralWithNumber(2),
                    text: context.l10n.intervalTwoIntervalsText,
                    isSelected: selectedValue == 2,
                    onTap: () => onChanged(2),
                  ),
                ),
                SizedBox(
                  width: gridItemWidth,
                  height: gridItemHeight,
                  child: CustomToggleButtonItem(
                    intervalCount: 3,
                    title: context.l10n.intervalPluralWithNumber(3),
                    text: context.l10n.intervalThreeIntervalsText,
                    isSelected: selectedValue == 3,
                    onTap: () => onChanged(3),
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

class CustomToggleButtonItem extends StatelessWidget {
  final String title;
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  final int intervalCount;

  const CustomToggleButtonItem({
    required this.intervalCount,
    required this.title,
    required this.text,
    required this.isSelected,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected
        ? Colors.black
        : AppColors.backgroundPaperLight;
    final textColor = isSelected ? AppColors.gold : Colors.black;

    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: TweenAnimationBuilder(
            tween: ColorTween(
              begin: AppColors.backgroundPaperLight,
              end: backgroundColor,
            ),
            duration: Durations.short4,
            builder: (context, color, child) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(DesignSpec.borderRadiusLg),
                  boxShadow: DesignSpec.defaultBoxShadow,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: DesignSpec.paddingSm,
                    horizontal: DesignSpec.paddingMd,
                  ),
                  child: TweenAnimationBuilder(
                    tween: ColorTween(
                      begin: Colors.black,
                      end: textColor,
                    ),
                    duration: Durations.short4,                    
                    builder: (context, tColor, child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                color: tColor, 
                                fontWeight: FontWeight.w800
                              ),
                          ),
                          Text(
                            text,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: tColor,
                            ),
                          ),
                          Gap.small(),
                          IntervalBar(
                            intervalCount: intervalCount,
                            highlightColor:
                                isSelected ? Colors.white : Colors.black,
                          ),
                        ],
                      );
                    }
                  ),
                ),
              );
            },
          ),
        ),
   
        Positioned(
          top: DesignSpec.paddingMd,
          right: DesignSpec.paddingMd,
          child: AnimatedOpacity(
            opacity: isSelected ? 1.0 : 0.0,
            duration: Durations.short4,
            child: Icon(Icons.check_circle, color: textColor, size: 24),
          ),
        ),
      ],
    );
  }
}

class IntervalBar extends StatelessWidget {
  final int intervalCount;
  final Color highlightColor;

  const IntervalBar({
    required this.intervalCount,
    this.highlightColor = AppColors.backgroundPaperLight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      intervalCount + 1,
      (index) => Expanded(
        child: Container(
          height: 12,
          decoration: BoxDecoration(
            color: highlightColor,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );

    return Row(spacing: DesignSpec.spacingSm, children: items);
  }
}
