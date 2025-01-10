import 'package:dhyana/bloc/timer_settings/timer_settings_bloc.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/timer/settings/timer_start_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings/all.dart';

class TimerSettingsView extends StatefulWidget {
  
  final TimerSettings timerSettings;
  
  const TimerSettingsView({
    required this.timerSettings,
    super.key
  });

  @override
  State<TimerSettingsView> createState() => _TimerSettingsViewState();
}

class _TimerSettingsViewState extends State<TimerSettingsView> {

  void _onWarmupChange(BuildContext context, Duration warmupDuration) {
    BlocProvider.of<TimerSettingsBloc>(context).add(
      TimerSettingsChanged(timerSettings: widget.timerSettings.copyWith(
        warmup: warmupDuration,
      ))
    );
  }

  void _onStartingSoundChange(BuildContext context, Sound startingSound) {
    BlocProvider.of<TimerSettingsBloc>(context).add(
      TimerSettingsChanged(timerSettings: widget.timerSettings.copyWith(
        startingSound: startingSound,
      ))
    );
  }

  void _onDurationChange(BuildContext context, Duration duration) {
    BlocProvider.of<TimerSettingsBloc>(context).add(
      TimerSettingsChanged(timerSettings: widget.timerSettings.copyWith(
        duration: duration,
      ))
    );
  }

  void _onEndingSoundChange(BuildContext context, Sound endingSound) {
    BlocProvider.of<TimerSettingsBloc>(context).add(
      TimerSettingsChanged(timerSettings: widget.timerSettings.copyWith(
        endingSound: endingSound,
      ))
    );
  }

  void _onStartButtonTap(BuildContext context) {
    TimerRoute($extra: widget.timerSettings).push(context);
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: buildInputs(context)
        ),
        buildStartButton(context),
      ],
    );
  }

  Widget buildInputs(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WarmupTimeInput(
            label: AppLocalizations.of(context).inputWarmupLabel,
            value: widget.timerSettings.warmup,
            onChange: (Duration duration) =>
              _onWarmupChange(context, duration)
        ),
        const _InputGapWithArrow(),
        SoundInput(
            label: AppLocalizations.of(context).inputStartingSoundLabel,
            value: widget.timerSettings.startingSound,
            onChange: (Sound startingSound) =>
              _onStartingSoundChange(context, startingSound)
        ),
        const _InputGapWithArrow(),
        DurationInput(
          label: AppLocalizations.of(context).inputDurationLabel,
          value: widget.timerSettings.duration,
          onChange: (Duration duration) =>
            _onDurationChange(context, duration),
        ),
        const _InputGapWithArrow(),
        SoundInput(
          label: AppLocalizations.of(context).inputEndingSoundLabel,
          value: widget.timerSettings.endingSound,
          onChange: (Sound endingSound) =>
            _onEndingSoundChange(context, endingSound)
        ),
      ],
    );
  }

  Widget buildStartButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: TimerStartButton(
        onTap: () => _onStartButtonTap(context),
        fragmentShader: context.services.shaderService.get('shaders/gradient_flow.frag'),
        timerSettings: widget.timerSettings,
      ),
    );
  }

}

class _InputGapWithArrow extends StatelessWidget {
  
  const _InputGapWithArrow();
  
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppThemeData.paddingMd,
        horizontal: 0,
      ),
      child: Icon(
        Icons.arrow_downward_rounded,
        size: 21,
      ),
    );
  }

}
