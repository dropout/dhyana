import 'package:dhyana/bloc/timer_settings/timer_settings_bloc.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/util/assets.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/app_theme_data.dart';
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

  @override
  void didUpdateWidget(TimerSettingsView oldWidget) {
    if (widget.timerSettings != oldWidget.timerSettings) {
      BlocProvider.of<TimerSettingsBloc>(context).add(
        TimerSettingsEvent.load(timerSettings: widget.timerSettings)
      );
    }
    super.didUpdateWidget(oldWidget);
  }

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
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: buildInputs(context)
          ),
          buildStartButton(context),
        ],
      ),
    );
  }

  Widget buildInputs(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppThemeData.padding2Xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StartTimeText(),
          buildInputGap(context),
          WarmupTimeInput(
            label: AppLocalizations.of(context).inputWarmupLabel,
            value: widget.timerSettings.warmup,
            overlayService: context.services.overlayService,
            onChange: (Duration duration) =>
              _onWarmupChange(context, duration)
          ),
          buildInputGap(context),
          SoundInput(
            label: AppLocalizations.of(context).inputStartingSoundLabel,
            overlayService: context.services.overlayService,
            value: widget.timerSettings.startingSound,
            onChange: (Sound startingSound) =>
              _onStartingSoundChange(context, startingSound)
          ),
          buildInputGap(context),
          DurationInput(
            label: AppLocalizations.of(context).inputDurationLabel,
            value: widget.timerSettings.duration,
            overlayService: context.services.overlayService,
            onChange: (Duration duration) =>
              _onDurationChange(context, duration),
          ),
          buildInputGap(context),
          SoundInput(
            label: AppLocalizations.of(context).inputEndingSoundLabel,
            overlayService: context.services.overlayService,
            value: widget.timerSettings.endingSound,
            onChange: (Sound endingSound) =>
              _onEndingSoundChange(context, endingSound)
          ),
          buildInputGap(context),
          EndTimeText(
            timerSettings: widget.timerSettings,
          ),
        ],
      ),
    );
  }

  Widget buildStartButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppThemeData.paddingLg),
        child: TimerStartButton(
          onTap: () => _onStartButtonTap(context),
          fragmentShader: context.services.shaderService.get(
            Assets.shaderGradientFlow
          ),
          timerSettings: widget.timerSettings,
        ),
      ),
    );
  }

  Widget buildInputGap(BuildContext context) {
    return Expanded(
      child: InputGap(
        isEndGap: false,
      ),
    );
  }

}
