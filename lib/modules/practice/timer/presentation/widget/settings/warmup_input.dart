import 'package:dhyana/service/overlay_service.dart';
import 'package:dhyana/modules/practice/timer/presentation/widget/settings/input_button.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:go_router/go_router.dart';

import 'warmup_input_view.dart';

/// A widget that allows users to select a warmup time for a timer.
/// By default, it provides options for 0, 1, 2, 3, and 5 minutes.
class WarmupTimeInput extends StatelessWidget {
  /// Label used for input view title.
  final String label;

  /// The selected warmup time value.
  final Duration value;

  /// Callback function that is called when the value changes.
  final void Function(Duration duration)? onChange;

  /// The service used to manage overlays, such as showing modal bottom sheets.
  final OverlayService overlayService;

  const WarmupTimeInput({
    required this.label,
    required this.value,
    required this.overlayService,
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
      enableDrag: false,
      (context) => WarmupInputView(
        title: label,
        initialValue: value.inMinutes,
        showStartEndTimes: false,              
        onSelect: (Duration duration) => _onSelected(context, duration),
      ),
    );
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return InputButton(
      key: const Key('warmup_time_input_button'),
      onTap: () => _onInputTap(context),
      padding: const EdgeInsets.all(DesignSpec.paddingXl),
      shape: CircleBorder(),
      child: Text(
        value.inMinutes.toString(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: AppColors.buttonForeground,
          fontWeight: FontWeight.w900,
          height: 1.0,
        ),
      ),
    );
  }
}
