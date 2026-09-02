import 'package:timer/src/domain/entity/timer_state_entity.dart';
import 'package:timer/src/domain/enum/timer_stage.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';

class TimerRunningTitle extends StatefulWidget {
  final TimerStateEntity timerState;
  final Offset positionOffset;

  const TimerRunningTitle({
    required this.timerState,
    required this.positionOffset,
    super.key,
  });

  @override
  State<TimerRunningTitle> createState() => _TimerRunningTitleState();
}

class _TimerRunningTitleState extends State<TimerRunningTitle> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 256),
      switchInCurve: Curves.easeOut,
      child: buildText(context, widget.timerState),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -0.25),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0, end: 1).animate(animation),
            child: child,
          ),
        );
      },
    );
  }

  Widget? buildText(BuildContext context, TimerStateEntity timerState) {
    TextStyle style = Theme.of(context).textTheme.titleLarge!.copyWith(
      fontFamily: DesignSpec.condensedFontFamilyName,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    switch (timerState.timerStage) {
      case TimerStage.timer:
        return null;
      case TimerStage.warmup:
        return Text(
          AppLocalizations.of(context).inputWarmupLabel,
          style: style,
          key: const ValueKey<String>('timer_running_title_warmup_title_text'),
        );
    }
  }
}
