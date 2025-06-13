import 'package:dhyana/service/all.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:go_router/go_router.dart';

import 'duration_input_view.dart';
import 'duration_input_button.dart';

/// A widget that allows users to select a warmup time for a timer.
/// By default, it provides options for 0, 1, 2, 3, and 5 minutes.
class WarmupTimeInput extends StatelessWidget {

  /// Label used for input view title.
  final String label;

  /// The selected warmup time value.
  final Duration value;

  /// List of available values in minutes.
  final List<int> availableValues;

  /// Callback function that is called when the value changes.
  final void Function(Duration duration)? onChange;

  /// The service used to manage overlays, such as showing modal bottom sheets.
  final OverlayService overlayService;

  const WarmupTimeInput({
    required this.label,
    required this.value,
    required this.overlayService,
    this.availableValues = const [0, 1, 2, 3, 5],
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
      key: Key('warmup_time_duration_input_button'),
      onTap: () => _onInputTap(context),
      padding: const EdgeInsets.all(AppThemeData.paddingMd),
      child: Text(value.inMinutes.toString(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: AppColors.backgroundPaperLight,
          fontWeight: FontWeight.w900,
          height: 1.0,
        )
      ),
    );
  }

}
