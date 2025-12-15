import 'package:dhyana/service/overlay_service.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:go_router/go_router.dart';

import 'duration_input_view.dart';
import 'duration_input_button.dart';

// Thanks to ChatGPT for generating this code snippet
// to be used as a _CONSTANT_ value in the constructor
// as a default parameter for available values.
const List<int> _defaultAvailableValues = [
  1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
  11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
  21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
  31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
  41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
  51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
  61, 62, 63, 64, 65, 66, 67, 68, 69, 70,
  71, 72, 73, 74, 75, 76, 77, 78, 79, 80,
  81, 82, 83, 84, 85, 86, 87, 88, 89, 90,
  91, 92, 93, 94, 95, 96, 97, 98, 99, 100,
  101, 102, 103, 104, 105, 106, 107, 108
];

/// A widget that allows users to select a duration for a timer.
/// By default, it provides options for 1 to 108 minutes.
class DurationInput extends StatelessWidget {

  /// Label used for input view title.
  final String label;

  /// The selected duration value.
  final Duration value;

  /// List of available values in minutes.
  final List<int> availableValues;

  /// Callback function that is called when the value changes.
  final void Function(Duration duration)? onChange;

  /// The service used to manage overlays, such as showing modal bottom sheets.
  final OverlayService overlayService;

  const DurationInput({
    required this.label,
    required this.value,
    required this.overlayService,
    this.availableValues = _defaultAvailableValues,
    this.onChange,
    super.key
  });

  void _onSelected(BuildContext context, Duration duration) {
    onChange?.call(duration);
    context.pop();
  }

  void _onInputTap(BuildContext context) {
    overlayService.showModalBottomSheet(
      context,
      (context) => DurationInputView(
        title: label,
        initialValue: value,
        availableValues: availableValues,
        onSelect: (Duration duration) => _onSelected(context, duration),
      )
    );
    context.hapticsTap();
  }
  
  @override
  Widget build(BuildContext context) {
    return DurationInputButton(
      key: Key('timer_duration_input_button'),
      onTap: () => _onInputTap(context),
      padding: const EdgeInsets.all(DesignSpec.paddingXl),
      child: Text(value.inMinutes.toString(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
          color: AppColors.backgroundPaperLight,
          fontWeight: FontWeight.w900,
          height: 1.0,
        )
      ),
    );
  }
  
}
