import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/input/int_dial_input.dart';
import 'package:dhyana/widget/timer/settings/input_view.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';

typedef DurationFormatter = String Function(Duration, bool);

class DurationInputView extends StatefulWidget {
  final int maxMinutes;
  final int minMinutes;
  final int? initialValue;
  final String title;
  final ValueChanged<Duration>? onSelect;
  final DurationFormatter? durationFormatter;

  const DurationInputView({
    this.maxMinutes = 60,
    this.minMinutes = 1,
    this.initialValue,
    this.title = '',
    this.onSelect,
    this.durationFormatter,
    super.key,
  });

  @override
  State<DurationInputView> createState() => _DurationInputViewState();
}

class _DurationInputViewState extends State<DurationInputView>
    with TickerProviderStateMixin {
  late int selectedMinutes;

  @override
  void initState() {
    super.initState();
    selectedMinutes = widget.initialValue ?? widget.minMinutes;
  }

  void _onSelectButtonPress(BuildContext context) {
    widget.onSelect?.call(Duration(minutes: selectedMinutes));
  }

  @override
  Widget build(BuildContext context) {
    return InputView(
      title: widget.title,
      onSave: () => _onSelectButtonPress(context),
      child: Padding(
        padding: const EdgeInsets.only(bottom: DesignSpec.paddingLg),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: IntDialInput(
                max: widget.maxMinutes,
                min: widget.minMinutes,
                selected: widget.initialValue,
                onChanged: (duration) {
                  setState(() {
                    selectedMinutes = duration;
                  });
                  context.services.hapticsService.select();
                },
              )
            ),
            
          ],
        ),
      )
    );
  }

  
}
