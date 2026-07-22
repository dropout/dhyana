import 'dart:async';

import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/input/int_dial_input.dart';
import 'package:dhyana/modules/practice/timer/presentation/widget/settings/input_gap.dart';
import 'package:dhyana/modules/practice/timer/presentation/widget/settings/input_view.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';

typedef DurationFormatter = String Function(Duration, bool);

class DurationInputView extends StatefulWidget {
  final int maxMinutes;
  final int minMinutes;
  final int? initialValue;
  final String title;
  final ValueChanged<Duration>? onSelect;
  final Duration preparationTime;
  final bool showStartEndTimes;

  const DurationInputView({
    this.maxMinutes = 60,
    this.minMinutes = 1,
    this.initialValue,
    this.title = '',
    this.onSelect,
    this.showStartEndTimes = true,
    this.preparationTime = const Duration(minutes: 0),
    super.key,
  });

  @override
  State<DurationInputView> createState() => _DurationInputViewState();
}

class _DurationInputViewState extends State<DurationInputView>
    with TickerProviderStateMixin {
  late int selectedMinutes;
  Duration elapsedTime = Duration.zero;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    selectedMinutes = widget.initialValue ?? widget.minMinutes;
    // Start a timer that ticks every second to update the start and end times
    if (widget.showStartEndTimes) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          elapsedTime = Duration(seconds: timer.tick);
        });
      });
    }
  }

  @override
  void didUpdateWidget(DurationInputView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.showStartEndTimes && _timer == null) {
      // Start the timer if we didn't have it before
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          elapsedTime = Duration(seconds: timer.tick);
        });
      });
    } else if (!widget.showStartEndTimes && _timer != null) {
      // Cancel the timer if we no longer need it
      _timer?.cancel();
      _timer = null;
    }
  }

  void _onSelectButtonPress(BuildContext context) {
    widget.onSelect?.call(Duration(minutes: selectedMinutes));
  }

  @override
  Widget build(BuildContext context) {
    final startTime = DateTime.now().add(widget.preparationTime);
    final endTime = startTime.add(Duration(minutes: selectedMinutes));

    return InputView(
      title: widget.title,
      onSave: () => _onSelectButtonPress(context),
      child: Padding(
        padding: const EdgeInsets.only(bottom: DesignSpec.paddingLg),
        child: Column(
          children: [
            if (widget.showStartEndTimes)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: DesignSpec.paddingLg,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // spacing: DesignSpec.spacing2xl,
                  children: [
                    // The start time of the session
                    SizedBox(
                      width: 120,
                      child: AppCard(
                        title: 'Start'.toUpperCase(),
                        titleGap: false,
                        child: Text(
                          startTime.toFormattedTimeString(context),
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                // fontFamily: DesignSpec.condensedFontFamilyName,
                              ),
                        ),
                      ),
                    ),

                    SizedBox.square(
                      dimension: 64,
                      child: RotatedBox(quarterTurns: 3, child: InputGap()),
                    ),

                    // End time of the session
                    SizedBox(
                      width: 120,
                      child: AppCard(
                        title: 'End'.toUpperCase(),
                        titleGap: false,
                        child: Text(
                          endTime.toFormattedTimeString(context),
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                // fontFamily: DesignSpec.condensedFontFamilyName,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
