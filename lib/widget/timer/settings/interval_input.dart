import 'package:dhyana/service/overlay_service.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/timer/settings/input_view.dart';
import 'package:dhyana/widget/timer/settings/input_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
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
        '${value.toString()} intervals',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.backgroundPaperLight,
          fontWeight: FontWeight.w800,
        )
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
              bottom: DesignSpec.paddingLg,
              top: DesignSpec.paddingMd,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  selectedCount.toString(),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: DesignSpec.paddingMd),
                ToggleButtons(
                  borderRadius: BorderRadius.circular(DesignSpec.borderRadiusMd),
                  constraints: const BoxConstraints(minWidth: 60, minHeight: 48),
                  onPressed: (index) {
                    setState(() {
                      selectedCount = options[index];
                    });
                    context.services.hapticsService.select();
                  },
                  isSelected: options
                      .map((option) => option == selectedCount)
                      .toList(growable: false),
                  children: options
                      .map(
                        (option) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: DesignSpec.paddingSm,
                          ),
                          child: Text(
                            option.toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      )
                      .toList(growable: false),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
