import 'package:timer/src/domain/entity/timer_state_entity.dart';
import 'package:timer/src/domain/enum/timer_status.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import 'package:timer/src/presentation/view/timer/timer_running_title.dart';
import 'package:timer/src/presentation/view/timer/timer_running_time.dart';
import 'package:timer/src/presentation/view/timer/timer_running_controls.dart';


class TimerRunningView extends StatefulWidget {

  final TimerStateEntity timerState;
  final WakelockService wakelockService;

  const TimerRunningView({
    required this.timerState,
    required this.wakelockService,
    super.key,
  });

  @override
  State<TimerRunningView> createState() => _TimerRunningViewState();
}

class _TimerRunningViewState extends State<TimerRunningView>
  with WidgetsBindingObserver {

  @override
  initState() {
    widget.wakelockService.enable();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  void _onBackground(BuildContext context) {
    // BlocProvider.of<TimerBloc>(context).add(TimerEvent.paused());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.timerState.timerStatus == TimerStatus.error) {
      return AppErrorDisplay(
        onButtonTap: () => GoRouter.of(context).pop(),
      );
    } else {
      return buildLayout(context);
    }
  }

  Widget buildLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DesignSpec.spacingMd),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: constraints.constrainHeight() / 2 - 88,
                width: constraints.maxWidth,
                child: TimerRunningTitle(
                  timerState: widget.timerState,
                  positionOffset: Offset(0.0,constraints.constrainHeight() / 2 - 88),
                )
              ),
              Center(
                child: TimerRunningTime(
                  timerState: widget.timerState
                )
              ),
              Align(
                alignment: const Alignment(0.0, 0.85),
                child: TimerRunningControls(
                  timerState: widget.timerState
                ),
              ),
            ],
          );
        }
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        _onBackground(context);
      default:
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    widget.wakelockService.disable();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

}
