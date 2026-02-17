import 'package:dhyana/bloc/chanting_settings/chanting_settings_cubit.dart';
import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/bloc/timer_settings/timer_settings_cubit.dart';
import 'package:dhyana/enum/session_type.dart';
import 'package:dhyana/model/profile_settings.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/util/all.dart';
import 'package:dhyana/widget/app_bar/custom_app_bar.dart';
import 'package:dhyana/widget/bloc_provider/timer_settings_cubit_provider.dart';
import 'package:dhyana/widget/chanting/chanting_settings_view.dart';
import 'package:dhyana/widget/home/session_mode_toggle.dart';
import 'package:dhyana/widget/presence/presence_button.dart';
import 'package:dhyana/widget/profile/profile_button.dart';
import 'package:dhyana/widget/timer/all.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final TimerSettings? timerSettings;

  const HomeScreen({
    this.timerSettings,
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  SessionType _sessionMode = SessionType.sitting;

  void _setSessionMode(SessionType mode) {
    if (mode == _sessionMode) {
      return;
    }
    setState(() {
      _sessionMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TimerSettingsCubitProvider(
      onCreate: (timerSettingsCubit) => timerSettingsCubit.loadTimerSettings(
        timerSettings: widget.timerSettings,
      ),
      child: Builder(
        builder: (context) {
          return BlocProvider<ChantingSettingsCubit>(
            create: (_) => ChantingSettingsCubit(
              chantsRepository: context.repos.chantsRepository,
              crashlyticsService: context.services.crashlyticsService,
            ),
            child: buildScaffolding(context),
          );
        },
      ),
    );
  }

  Widget buildScaffolding(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CustomAppBar(
        leading: Today(
          key: ValueKey(DateTime.now().toDayId()),
        ),
        trailing: [
          SignedIn(yes: (context, profileId) {
            return PresenceButton();
          }),
          SignedIn(yes: (context, profileId) {
            return TimerSettingsHistoryButton(profileId: profileId);
          }),
          const ProfileButton(),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<TimerSettingsCubit, TimerSettingsState>(
        builder: (BuildContext context, TimerSettingsState state) {
          return switch (state) {
            TimerSettingsDataErrorState() => const AppErrorDisplay(),
            TimerSettingsDataLoadingState() => const AppLoadingDisplay(),
            TimerSettingsDataLoadedState() => buildLoadedState(context, state),
          };
        },
      ),
    );
  }

  Widget buildLoadedState(
    BuildContext context,
    TimerSettingsDataLoadedState state,
  ) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, profileState) {
        final profileSettings = switch (profileState) {
          ProfileLoadedState(:final settings) => settings,
          _ => const ProfileSettings(id: 'anonymous'),
        };

        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SessionModeToggle(
                  activeMode: _sessionMode,
                  onModeChanged: _setSessionMode,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: AnimatedSwitcher(
                  duration: Durations.short4,
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  layoutBuilder: (currentChild, previousChildren) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        ...previousChildren,
                        if (currentChild != null) currentChild,
                      ],
                    );
                  },
                  child: switch (_sessionMode) {
                    SessionType.sitting => TimerSettingsView(
                        key: const ValueKey('timer-settings-view'),
                        timerSettings: state.timerSettings,
                        profileSettings: profileSettings,
                      ),
                    SessionType.chanting => _buildChantingSettingsView(
                        context,
                      ),
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChantingSettingsView(BuildContext context) {
    return BlocBuilder<ChantingSettingsCubit, ChantingSettingsState>(
      builder: (context, chantingState) {
        return ChantingSettingsView(
          key: const ValueKey('chanting-settings-view'),
          chants: chantingState.selectedChants,
          onReorder: (oldIndex, newIndex) {
            context.read<ChantingSettingsCubit>().reorder(oldIndex, newIndex);
          },
        );
      },
    );
  }
}
