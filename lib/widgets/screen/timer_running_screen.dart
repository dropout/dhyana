import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/widgets/bloc_provider/timer_running_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widgets/timer/timer_completed_view.dart';
import 'package:dhyana/widgets/timer/timer_running_view.dart';

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
      child: const TimerRunningScreenBody(),
    );
  }

}

class TimerRunningScreenBody extends StatelessWidget {
  const TimerRunningScreenBody({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<TimerBloc, TimerState>(
        listenWhen: (TimerState prev, TimerState next) {
          return (prev.timerStatus != TimerStatus.completed && next.timerStatus == TimerStatus.completed);
        },
        listener: (BuildContext context, TimerState state) {

          DateTime endTime = state.endTime ?? DateTime.now();
          DateTime startTime = state.startTime ?? endTime.subtract(state.timerSettings.duration);
          BlocProvider.of<SessionsBloc>(context).add(
            SessionsEvent.addSession(
              startTime: startTime,
              endTime: endTime,
              timerSettings: state.timerSettings,
            )
          );

        },
        builder: (BuildContext context, TimerState timerState) {
          final bool isCompleted =
            (timerState.timerStatus == TimerStatus.completed);
          CrossFadeState crossFadeState;
          if (isCompleted) {
            crossFadeState = CrossFadeState.showSecond;
          } else {
            crossFadeState = CrossFadeState.showFirst;
          }
          return AnimatedCrossFade(
            duration: const Duration(milliseconds: 256),
            firstChild: TimerRunningView(
              timerState: timerState,
              onBackground: _onBackground(context),
              onResume: _onResume(context),
            ),
            secondChild: TimerCompletedView(timerState: timerState),
            layoutBuilder: (Widget firstChild, Key firstKey, Widget secondChild, Key secondKey) {
              return Stack(
                // Align the non-positioned child to center.
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: <Widget>[
                  Positioned.fill(
                    key: secondKey,
                    // Instead of forcing the positioned child to a width
                    // with left / right, just stick it to the top.
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
          );
        },
      )
    );
  }

}
