import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/widget/bloc_provider/timer_running_bloc_provider.dart';
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
      child: const TimerRunningScreenBody(),
    );
  }

}

class TimerRunningScreenBody extends StatefulWidget {
  const TimerRunningScreenBody({super.key});

  @override
  State<TimerRunningScreenBody> createState() => _TimerRunningScreenBodyState();
}

class _TimerRunningScreenBodyState extends State<TimerRunningScreenBody> {

  bool isOverlayEnabled = false;

  void _onInit(BuildContext context) {
    TimerBloc timerBloc = BlocProvider.of<TimerBloc>(context);
    timerBloc.add(TimerEvent.started());
    PresenceBloc presenceBloc = BlocProvider.of<PresenceBloc>(context);
    presenceBloc.add(const PresenceEvent.showPresence());
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildBody(context),
          buildOverlay(context),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ThemeData themeData = Theme.of(context).copyWith(
        textTheme: textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        )
    );
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            buildOverlayClickTarget(context),
            SafeArea(
              child: Theme(
                data: themeData,
                child: BlocBuilder<TimerBloc, TimerState>(
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
                        onInit: () => _onInit(context),
                        onBackground: _onBackground(context),
                        onResume: _onResume(context),
                      ),
                      secondChild: TimerCompletedView(
                        timerState: timerState,
                      ),
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
                ),
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

  Widget buildOverlay(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOverlayEnabled = false;
        });
      },
      child: TimerRunningOverlay(
        isEnabled: isOverlayEnabled
      ),
    );
  }

}
