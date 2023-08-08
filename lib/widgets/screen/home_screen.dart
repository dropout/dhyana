import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/bloc/timer_settings/timer_settings_bloc.dart';
import 'package:dhyana/enum/sound.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/route/all.dart';
import 'package:dhyana/widgets/app_colors.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:dhyana/widgets/bloc_provider/timer_settings_bloc_provider.dart';
import 'package:dhyana/widgets/duration_time_indicator.dart';
import 'package:dhyana/widgets/profile/profile_avatar.dart';
import 'package:dhyana/widgets/settings/settings_icon.dart';
import 'package:dhyana/widgets/timer/input/duration_input.dart';
import 'package:dhyana/widgets/timer/input/sound_input.dart';
import 'package:dhyana/widgets/timer/input/warmup_input.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TimerSettingsBlocProvider(
      child: BlocBuilder<TimerSettingsBloc, TimerSettingsState>(
        builder: (BuildContext context, TimerSettingsState state) {
          if (state is TimerSettingsDataErrorState) {
            return const Text('Error occured');
          }

          if (state is TimerSettingsDataLoadingState) {
            return const Text('Loading');
          }

          if (state is TimerSettingsDataLoadedState) {
            return HomeScreenBody(
              timerSettings: state.timerSettings
            );
          }

          return Container();
        }
      )
    );
  }

}

class HomeScreenBody extends StatelessWidget {

  final TimerSettings timerSettings;

  const HomeScreenBody({
    required this.timerSettings,
    super.key
  });

  void _onWarmupChange(BuildContext context, Duration warmupDuration) {
    BlocProvider.of<TimerSettingsBloc>(context).add(
      TimerSettingsChanged(timerSettings: timerSettings.copyWith(
        warmup: warmupDuration,
      ))
    );
  }

  void _onStartingSoundChange(BuildContext context, Sound startingSound) {
    BlocProvider.of<TimerSettingsBloc>(context).add(
      TimerSettingsChanged(timerSettings: timerSettings.copyWith(
        startingSound: startingSound,
      ))
    );
  }

  void _onDurationChange(BuildContext context, Duration duration) {
    BlocProvider.of<TimerSettingsBloc>(context).add(
      TimerSettingsChanged(timerSettings: timerSettings.copyWith(
        duration: duration,
      ))
    );
  }

  void _onEndingSoundChange(BuildContext context, Sound endingSound) {
    BlocProvider.of<TimerSettingsBloc>(context).add(
      TimerSettingsChanged(timerSettings: timerSettings.copyWith(
        endingSound: endingSound,
      ))
    );
  }

  void _onStartButtonTap(BuildContext context) {
    context.goNamed(
      AppScreen.timerRunning.name,
      extra: timerSettings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerSettingsBloc, TimerSettingsState>(
      builder: (context, state) {

        if (state is TimerSettingsDataErrorState) {
          return const Text('Error occured');
        }

        if (state is TimerSettingsDataLoadingState) {
          return const Text('Loading');
        }

        if (state is TimerSettingsDataLoadedState) {
          return _buildScaffold(context, state.timerSettings);
        }

        return Container();
      },
    );
  }

  Widget _buildScaffold(BuildContext context, TimerSettings timerSettings) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundPaper,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Positioned(
              top: AppThemeData.spacingMd,
              right: AppThemeData.spacingMd,
              // child: ProfileAvatar()
              child: Wrap(
                children: [
                  SettingsIcon(),
                  SizedBox(width: AppThemeData.spacingXs),
                  ProfileAvatar()
                ],
              )
            ),
            Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WarmupTimeInput(
                        label: AppLocalizations.of(context).inputWarmupLabel,
                        value: timerSettings.warmup,
                        onChange: (Duration duration) => _onWarmupChange(context, duration)
                      ),
                      const HomeScreenItemGap(),
                      SoundInput(
                        label: AppLocalizations.of(context).inputStartingSoundLabel,
                        value: timerSettings.startingSound,
                        onChange: (Sound startingSound) => _onStartingSoundChange(context, startingSound)
                      ),
                      const HomeScreenItemGap(),
                      DurationInput(
                        label: AppLocalizations.of(context).inputDurationLabel,
                        value: timerSettings.duration,
                        onChange: (Duration duration) => _onDurationChange(context, duration),
                      ),
                      const HomeScreenItemGap(),
                      SoundInput(
                        label: AppLocalizations.of(context).inputEndingSoundLabel,
                        value: timerSettings.endingSound,
                        onChange: (Sound endingSound) => _onEndingSoundChange(context, endingSound)
                      ),
                    ],
                  ),
                ),
                DurationTimeIndicator(
                  timerSettings: timerSettings,
                  key: ValueKey<TimerSettings>(timerSettings),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppThemeData.spacingMd),
                  child: TextButton(
                    onPressed: () => _onStartButtonTap(context),
                    style: TextButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48.0),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppThemeData.borderRadiusMd)
                        )
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context).startTimerButtonText.toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        )
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenItemGap extends StatelessWidget {
  const HomeScreenItemGap({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: AppThemeData.spacing3xl,
      child: Icon(
        Icons.arrow_downward_rounded,
        size: 21,
      ),
    );
  }
}
