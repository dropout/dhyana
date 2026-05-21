import 'package:dhyana/service/overlay_service.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/design_spec.dart';
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

  /// Minimum warmup time in minutes. Default is 0.
  /// This allows users to have no warmup time if they choose.
  final int minMinutes;
  
  /// Maximum warmup time in minutes. Default is 5.
  /// This provides a reasonable upper limit for warmup times.
  final int maxMinutes;

  /// Callback function that is called when the value changes.
  final void Function(Duration duration)? onChange;

  /// The service used to manage overlays, such as showing modal bottom sheets.
  final OverlayService overlayService;

  const WarmupTimeInput({
    required this.label,
    required this.value,
    required this.overlayService,
    this.minMinutes = 0,
    this.maxMinutes = 5,
    this.onChange,
    super.key,
  });

  void _onSelected(BuildContext context, Duration duration) {
    onChange?.call(duration);
    context.pop();
  }

  void _onInputTap(BuildContext context) {
    overlayService.showModalBottomSheet(
      context,
      enableDrag: false,
      (context) => DurationInputView(
        title: label,
        initialValue: value.inMinutes,
        minMinutes: minMinutes,
        maxMinutes: maxMinutes,        
        onSelect: (Duration duration) => _onSelected(context, duration),
      ),
    );
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return DurationInputButton(
      key: Key('warmup_time_duration_input_button'),
      onTap: () => _onInputTap(context),
      padding: const EdgeInsets.all(DesignSpec.paddingMd),
      child: Text(
        value.inMinutes.toString(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: AppColors.backgroundPaperLight,
          fontWeight: FontWeight.w900,
          height: 1.0,
        ),
      ),
    );
  }
}
