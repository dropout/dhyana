import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/route/all.dart';
import 'package:dhyana/widgets/app_theme_data.dart';

class TimerCompletedView extends StatelessWidget {

  final TimerState timerState;

  const TimerCompletedView({
    required this.timerState,
    super.key
  });

  void _onOkayButtonPressed(BuildContext context) {
    context.goNamed(AppScreen.home.name);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: Column(
              children: [
                Text('Completed!',
                  style: Theme.of(context).textTheme.displayMedium
                ),
                const SizedBox(height: AppThemeData.spacingMd),
                buildStats(context, timerState),
              ],
            )
          )
        ),
        Padding(
          padding: const EdgeInsets.all(AppThemeData.spacingMd),
          child: TextButton(
            onPressed: () => _onOkayButtonPressed(context),
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
              AppLocalizations.of(context).okay.toUpperCase(),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              )
            ),
          ),
        ),
      ],
    );
  }

  Widget buildStats(BuildContext context, TimerState timerState) {

    DateTime startedAt = DateTime.now().subtract(timerState.elapsedTime);
    DateTime finishedAt = DateTime.now();

    return Column(
      children: [
        Text('Started at: ${startedAt.toLocal()}'),
        Text('Finished at: ${finishedAt.toLocal()}'),
        Text('Duration: ${timerState.elapsedTime}'),
      ],
    );

  }

}
