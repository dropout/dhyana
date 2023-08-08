import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/widgets/app_colors.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:dhyana/widgets/timer/input/duration_input_view.dart';

class DurationInput extends StatefulWidget {
  
  final String label;
  final Duration value;
  final void Function(Duration duration)? onChange;
  
  const DurationInput({
    required this.label,
    required this.value,
    this.onChange,
    super.key
  });

  @override
  State<DurationInput> createState() => _DurationInputState();

}

class _DurationInputState extends State<DurationInput> {

  void _onSelected(BuildContext context, Duration duration) {
    widget.onChange?.call(duration);
    context.pop();
  }

  void _onInputTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.backgroundPaper,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      useRootNavigator: true,
      builder: (context) {
        return DurationInputView(
          title: widget.label,
          initialValue: widget.value,
          values: List<int>.generate(108, (int i) => i+1),
          onSelect: (Duration duration) => _onSelected(context, duration),
        );
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _onInputTap(context),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppThemeData.spacingMd,
              vertical: AppThemeData.spacingMd
            ),
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.black
            ),
            child: Center(
              child: Text(
                widget.value.inMinutes.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 56,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  
}
