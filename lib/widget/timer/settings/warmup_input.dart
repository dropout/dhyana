import 'package:dhyana/widget/timer/settings/all.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';


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

  void _onDurationSelected(BuildContext context, Duration duration) {
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
          values: const [0,1,2,3,5],
          onSelect: (Duration duration) => _onDurationSelected(context, duration),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onInputTap(context),
      child: Container(
        padding: const EdgeInsets.all(
          AppThemeData.paddingMd,
        ),
        decoration: ShapeDecoration(
          shape: CustomDurationCircleBorder(),
          color: Colors.black
        ),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Text(widget.value.inMinutes.toString(),
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              height: 1.0,
            )
          ),
        )
      ),
    );
  }

}
