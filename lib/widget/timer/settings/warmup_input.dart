import 'package:dhyana/widget/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:go_router/go_router.dart';

import 'duration_input_view.dart';
import 'duration_input_button.dart';

class WarmupTimeInput extends StatefulWidget {

  final String label;
  final Duration value;
  final void Function(Duration duration)? onChange;

  const WarmupTimeInput({
    required this.label,
    required this.value,
    this.onChange,
    super.key
  });

  @override
  State<WarmupTimeInput> createState() => _WarmupTimeInputState();

}

class _WarmupTimeInputState extends State<WarmupTimeInput> {

  void _onSelected(BuildContext context, Duration duration) {
    widget.onChange?.call(duration);
    context.pop();
  }

  void _onInputTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      useRootNavigator: true,
      builder: (context) {
        return DurationInputView(
          title: widget.label,
          initialValue: widget.value,
          values: const [0,1,2,3,5],
          onSelect: (Duration duration) => _onSelected(context, duration),
        );
      }
    );
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return DurationInputButton(
      onTap: () => _onInputTap(context),
      padding: const EdgeInsets.all(AppThemeData.paddingMd),
      child: Text(widget.value.inMinutes.toString(),
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
