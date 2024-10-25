import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/bloc/timer_settings_history/timer_settings_history_bloc.dart';
import 'package:dhyana/widget/bloc_provider/all.dart';
import 'package:dhyana/widget/timer/running/timer_running_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/timer/timer_completed_view.dart';
import 'package:dhyana/widget/timer/timer_running_view.dart';

class TimerRunningScreen extends StatelessWidget {

  final TimerSettings timerSettings;

  const TimerRunningScreen({
    required this.timerSettings,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TimerRunningBlocProvider(
      timerSettings: timerSettings,
      child: TimerRunningScreenContent(
        timerSettings: timerSettings,
      ),
    );
  }

}

class TimerRunningScreenContent extends StatefulWidget {

  final TimerSettings timerSettings;

  const TimerRunningScreenContent({
    required this.timerSettings,
    super.key,
  });

  @override
  State<TimerRunningScreenContent> createState() => _TimerRunningScreenContentState();
}

class _TimerRunningScreenContentState extends State<TimerRunningScreenContent> {

  bool isOverlayEnabled = false;

  void _onInit(BuildContext context) {

    // Start the timer
    TimerBloc timerBloc = BlocProvider.of<TimerBloc>(context);
    timerBloc.add(TimerEvent.started());

    // Show presence
    PresenceBloc presenceBloc = BlocProvider.of<PresenceBloc>(context);
    presenceBloc.add(const PresenceEvent.showPresence());

    // Save the timer settings to timer settings history
    TimerSettingsHistoryBloc timerSettingsHistoryBloc =
        BlocProvider.of<TimerSettingsHistoryBloc>(context);
    timerSettingsHistoryBloc.add(
      TimerSettingsHistoryEvent.saveSettings(
        timerSettings: widget.timerSettings
      )
    );

  }

  void Function() _onBackground(BuildContext context) {
    TimerBloc timerBloc = BlocProvider.of<TimerBloc>(context);
    return () {
      timerBloc.add(TimerEvent.paused());
    };
  }

  void Function() _onResume(BuildContext context) {
    TimerBloc timerBloc = BlocProvider.of<TimerBloc>(context);
    return () {
      timerBloc.add(TimerEvent.resumed());
    };
  }

  // void _onOverlayToggle

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (BuildContext context, TimerState state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              buildBody(context, state),
              buildOverlay(context, state),
            ],
          ),
        );
      },
    );
  }

  Widget buildBody(BuildContext context, TimerState timerState) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ThemeData themeData = Theme.of(context).copyWith(
      textTheme: textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      )
    );

    final bool isCompleted = (timerState.timerStatus == TimerStatus.completed);
    CrossFadeState crossFadeState;
    if (isCompleted) {
      crossFadeState = CrossFadeState.showSecond;
    } else {
      crossFadeState = CrossFadeState.showFirst;
    }

    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            buildOverlayClickTarget(context),
            SafeArea(
              child: Theme(
                data: themeData,
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 256),
                  firstChild: TimerRunningView(
                    timerState: timerState,
                    onInit: () => _onInit(context),
                    onBackground: _onBackground(context),
                    onResume: _onResume(context),
                  ),
                  secondChild: TimerCompletedView(
                    timerState: timerState,
                  ),
                  layoutBuilder: (Widget firstChild, Key firstKey, Widget secondChild, Key secondKey) {
                    return Stack(
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Positioned.fill(
                          key: secondKey,
                          top: 0,
                          child: secondChild,
                        ),
                        Positioned.fill(
                          key: firstKey,
                          top: 0,
                          child: firstChild,
                        ),
                      ],
                    );
                  },
                  crossFadeState: crossFadeState,
                )
              ),
            ),
          ],
        )
    );
  }

  Widget buildOverlayClickTarget(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isOverlayEnabled = true;
          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
        )
    );
  }

  Widget buildOverlay(BuildContext context, TimerState timerState) {
    // If the timer is completed, this should be false anyway
    final bool shouldShowOverlay =
      isOverlayEnabled && timerState.timerStatus != TimerStatus.completed;

    return GestureDetector(
      onTap: () {
        setState(() {
          isOverlayEnabled = false;
        });
      },
      child: TimerRunningOverlay(
        isEnabled: shouldShowOverlay
      ),
    );
  }

}
