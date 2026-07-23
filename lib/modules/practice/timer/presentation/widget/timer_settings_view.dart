import 'package:dhyana/modules/practice/timer/presentation/bloc/timer_settings/timer_settings_cubit.dart';
import 'package:dhyana/core/domain/enum/sound.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/modules/account/domain/model/profile_settings.dart';
import 'package:dhyana/modules/practice/timer/domain/model/timer_settings.dart';
import 'package:dhyana/util/assets.dart';
import 'package:dhyana/core/navigation/app_routes.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/widget/session_start_button.dart';
import 'package:dhyana/core/presentation/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/modules/practice/timer/presentation/widget/settings/warmup_input.dart';
import 'package:dhyana/modules/practice/timer/presentation/widget/settings/sound_input.dart';
import 'package:dhyana/modules/practice/timer/presentation/widget/settings/duration_input.dart';
import 'package:dhyana/modules/practice/timer/presentation/widget/settings/interval_input.dart';
import 'package:dhyana/modules/practice/timer/presentation/widget/settings/input_gap.dart';


class TimerSettingsView extends StatefulWidget {
  
  final TimerSettings timerSettings;
  final ProfileSettings profileSettings;
  
  const TimerSettingsView({
    required this.timerSettings,
    required this.profileSettings,
    super.key
  });

  @override
  State<TimerSettingsView> createState() => _TimerSettingsViewState();
}

class _TimerSettingsViewState extends State<TimerSettingsView> {

  @override
  void didUpdateWidget(TimerSettingsView oldWidget) {
    if (widget.timerSettings != oldWidget.timerSettings) {
      context.read<TimerSettingsCubit>().timerSettingsChanged(widget.timerSettings);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onWarmupChange(BuildContext context, Duration warmupDuration) {
    context.read<TimerSettingsCubit>().timerSettingsChanged(
      widget.timerSettings.copyWith(
        warmup: warmupDuration,
      )
    );
  }

  void _onStartingSoundChange(BuildContext context, Sound startingSound) {
    context.read<TimerSettingsCubit>().timerSettingsChanged(
      widget.timerSettings.copyWith(
        startingSound: startingSound,
      )
    );
  }

  void _onDurationChange(BuildContext context, Duration duration) {
    context.read<TimerSettingsCubit>().timerSettingsChanged(
      widget.timerSettings.copyWith(
        duration: duration,
      )
    );
  }

  void _onIntervalCountChange(BuildContext context, int intervalCount) {
    context.read<TimerSettingsCubit>().timerSettingsChanged(
      widget.timerSettings.copyWith(
        intervalCount: intervalCount,
      )
    );
  }

  void _onEndingSoundChange(BuildContext context, Sound endingSound) {
    context.read<TimerSettingsCubit>().timerSettingsChanged(
      widget.timerSettings.copyWith(
        endingSound: endingSound,
      )
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
      padding: const EdgeInsets.symmetric(vertical: DesignSpec.padding2Xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
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
            preparationTime: widget.timerSettings.warmup,
            overlayService: context.services.overlayService,
            onChange: (Duration duration) =>
              _onDurationChange(context, duration),
          ),
          buildInputGap(context),
          IntervalInput(
            label: AppLocalizations.of(context).inputIntervalCountLabel,
            value: widget.timerSettings.intervalCount,
            overlayService: context.services.overlayService,
            onChange: (int intervalCount) =>
              _onIntervalCountChange(context, intervalCount),
          ),
          buildInputGap(context),
          SoundInput(
            label: AppLocalizations.of(context).inputEndingSoundLabel,
            overlayService: context.services.overlayService,
            value: widget.timerSettings.endingSound,
            onChange: (Sound endingSound) =>
              _onEndingSoundChange(context, endingSound)
          ),
        ],
      ),
    );
  }

  Widget buildStartButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DesignSpec.paddingLg),
      child: SessionStartButton(
        onTap: () => _onStartButtonTap(context),
        fragmentShader: context.services.shaderService.get(
          Assets.shaderGradientFlow
        ),
        colorA: AppColors.crimsonRed,
        colorB: Color(0xFFD93838), // Crimson Red Tint 3
      ),
    );
  }

  Widget buildInputGap(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 42,
      ),
      child: InputGap(
        isEndGap: false,
      )
    );
  }

}
