import 'package:dhyana/service/overlay_service.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:go_router/go_router.dart';

import 'duration_input_view.dart';
import 'input_button.dart';

/// A widget that allows users to select a duration for a timer.
/// By default, it provides options for 1 to 108 minutes.
class DurationInput extends StatelessWidget {
  /// Label used for input view title.
  final String label;

  /// The selected duration value.
  final Duration value;

  // To show session start and end time correctly in the input view
  final Duration preparationTime;

  /// Minimum duration in minutes. Default is 1.
  /// This ensures that users select a positive duration.
  final int minMinutes;

  /// Maximum duration in minutes. Default is 60.
  /// This provides a reasonable upper limit for timer durations.
  final int maxMinutes;

  /// Callback function that is called when the value changes.
  final void Function(Duration duration)? onChange;

  /// The service used to manage overlays, such as showing modal bottom sheets.
  final OverlayService overlayService;

  /// Creates an instance of the DurationInput widget.
  const DurationInput({
    required this.label,
    required this.value,
    required this.preparationTime,
    required this.overlayService,
    this.minMinutes = 1,
    this.maxMinutes = 60,
    this.onChange,
    super.key,
  });

  void _onSelected(BuildContext context, Duration duration) {
    onChange?.call(duration);
    context.hapticsTap();
    context.pop();
  }

  void _onInputTap(BuildContext context) {
    overlayService.showModalBottomSheet(
      context,
      (context) => DurationInputView(
        title: label,
        initialValue: value.inMinutes,
        preparationTime: preparationTime,
        minMinutes: minMinutes,
        maxMinutes: maxMinutes,
        onSelect: (Duration duration) => _onSelected(context, duration),
      ),
      enableDrag: false,
    );
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return InputButton(
      key: Key('timer_duration_input_button'),
      onTap: () => _onInputTap(context),
      padding: const EdgeInsets.all(DesignSpec.paddingXl),
      shape: CircleBorder(),
      child: Text(
        value.inMinutes.toString(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
          color: AppColors.mintGreen,
          fontWeight: FontWeight.w900,
          height: 1.0,
        ),
      ),
    );
  }
}
