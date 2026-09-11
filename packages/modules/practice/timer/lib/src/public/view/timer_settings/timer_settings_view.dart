import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';
import 'package:timer/l10n/timer_localizations.dart';
import 'package:timer/src/public/viewmodel/timer_settings_cubit.dart';
import 'package:timer/src/timer_module.dart';
import 'package:timer/src/timer_routes.dart';
import 'package:timer/src/public/view/timer_settings/warmup_input.dart';
import 'package:timer/src/public/view/timer_settings/sound_input.dart';
import 'package:timer/src/public/view/timer_settings/duration_input.dart';
import 'package:timer/src/public/view/timer_settings/interval_input.dart';


/// Let's the user configure the timer settings.
class TimerSettingsView extends StatelessWidget {
  final TimerSettings timerSettings;

  static Widget withCubit() {
    return BlocProvider.value(
      value: GetIt.instance.get<TimerSettingsCubit>(),
      key: const ValueKey('timer_settings_cubit'),
      child: Builder(
        builder: (context) =>
            BlocBuilder<TimerSettingsCubit, TimerSettingsState>(
              builder: (context, state) => TimerSettingsView(
                timerSettings: state.timerSettings,
                key: const ValueKey('timer_settings_view'),
              ),
            ),
      ),
    );
  }

  const TimerSettingsView({required this.timerSettings, super.key});

  void _onWarmupChange(BuildContext context, Duration warmupDuration) {
    context.read<TimerSettingsCubit>().timerSettingsChanged(
      timerSettings.copyWith(warmup: warmupDuration),
    );
  }

  void _onStartingSoundChange(BuildContext context, Sound startingSound) {
    context.read<TimerSettingsCubit>().timerSettingsChanged(
      timerSettings.copyWith(startingSound: startingSound),
    );
  }

  void _onDurationChange(BuildContext context, Duration duration) {
    context.read<TimerSettingsCubit>().timerSettingsChanged(
      timerSettings.copyWith(duration: duration),
    );
  }

  void _onIntervalCountChange(BuildContext context, int intervalCount) {
    context.read<TimerSettingsCubit>().timerSettingsChanged(
      timerSettings.copyWith(intervalCount: intervalCount),
    );
  }

  void _onEndingSoundChange(BuildContext context, Sound endingSound) {
    context.read<TimerSettingsCubit>().timerSettingsChanged(
      timerSettings.copyWith(endingSound: endingSound),
    );
  }

  void _onStartButtonTap(BuildContext context) {
    TimerRoute().push(context);
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: buildInputs(context)),
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
          buildLabel(context, TimerLocalizations.of(context).inputWarmupLabel),
          WarmupInput(
            label: TimerLocalizations.of(context).inputWarmupLabel,
            value: timerSettings.warmup,
            overlayService: context.services.overlayService,
            onChange: (Duration duration) => _onWarmupChange(context, duration),
          ),
          buildInputGap(context),
          buildLabel(context, TimerLocalizations.of(context).inputStartingSoundLabel),
          SoundInput(
            label: TimerLocalizations.of(context).inputStartingSoundLabel,
            overlayService: context.services.overlayService,
            value: timerSettings.startingSound,
            onChange: (Sound startingSound) =>
                _onStartingSoundChange(context, startingSound),
          ),
          buildInputGap(context),
          buildLabel(context, TimerLocalizations.of(context).inputDurationLabel),
          DurationInput(
            label: TimerLocalizations.of(context).inputDurationLabel,
            value: timerSettings.duration,
            preparationTime: timerSettings.warmup,
            overlayService: context.services.overlayService,
            onChange: (Duration duration) =>
                _onDurationChange(context, duration),
          ),
          buildInputGap(context),
          buildLabel(context, TimerLocalizations.of(context).inputIntervalCountLabel),
          IntervalInput(
            label: TimerLocalizations.of(context).inputIntervalCountLabel,
            value: timerSettings.intervalCount,
            overlayService: context.services.overlayService,
            onChange: (int intervalCount) =>
                _onIntervalCountChange(context, intervalCount),
          ),
          buildInputGap(context),
          buildLabel(context, TimerLocalizations.of(context).inputEndingSoundLabel),
          SoundInput(
            label: TimerLocalizations.of(context).inputEndingSoundLabel,
            overlayService: context.services.overlayService,
            value: timerSettings.endingSound,
            onChange: (Sound endingSound) =>
                _onEndingSoundChange(context, endingSound),
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
        colorA: AppColors.crimsonRed,
        colorB: Color(0xFFD93838), // Crimson Red Tint 3
      ),
    );
  }

  Widget buildInputGap(BuildContext context) =>
    Gap.flexible(size: DesignSpec.spacingLg);

  Widget buildLabel(BuildContext context, String label) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: context.theme.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.charcoal,
          ),
        ),
        Gap.xs(),
      ],
    );

}
