import 'package:dhyana/bloc/timer_settings/timer_settings_bloc.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/route/app_screen.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/app_stadium_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    context.pushNamed(
      AppScreen.timerRunning.name,
      extra: widget.timerSettings,
    );
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
            onChange: (Duration duration) => _onWarmupChange(context, duration)
        ),

        const _ItemGap(),

        SoundInput(
            label: AppLocalizations.of(context).inputStartingSoundLabel,
            value: widget.timerSettings.startingSound,
            onChange: (Sound startingSound) => _onStartingSoundChange(context, startingSound)
        ),

        const _ItemGap(),

        DurationInput(
          label: AppLocalizations.of(context).inputDurationLabel,
          value: widget.timerSettings.duration,
          onChange: (Duration duration) => _onDurationChange(context, duration),
        ),

        const _ItemGap(),

        SoundInput(
            label: AppLocalizations.of(context).inputEndingSoundLabel,
            value: widget.timerSettings.endingSound,
            onChange: (Sound endingSound) => _onEndingSoundChange(context, endingSound)
        ),

      ],
    );
  }

  Widget buildStartButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          DurationIndicator(
            timerSettings: widget.timerSettings,
            key: ValueKey<TimerSettings>(widget.timerSettings),
          ),

          Padding(
            padding: const EdgeInsets.all(AppThemeData.spacingMd),
            child: AppStadiumButton(
              onTap: () => _onStartButtonTap(context),
              text: AppLocalizations.of(context).startTimerButtonText.toUpperCase(),
              fColor: Colors.white,
              bColor: AppColors.bloodRed,
            ),
          ),

        ],
      ),
    );
  }


}

class _ItemGap extends StatelessWidget {
  
  const _ItemGap();
  
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
