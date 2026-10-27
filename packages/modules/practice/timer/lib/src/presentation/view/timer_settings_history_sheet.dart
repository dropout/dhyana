import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:material_ui/material_ui.dart';
import 'package:timer/l10n/timer_localizations.dart';
import 'package:timer/src/presentation/viewmodel/timer_settings_history/timer_settings_history_cubit.dart';
import 'package:timer/src/public/view/timer_settings/input_view.dart';
import 'package:timer/src/public/view/timer_settings_history/timer_settings_history_grid.dart';

class TimerSettingsHistorySheet extends StatelessWidget {
  final String profileId;

  static const double _fadeExtent = 24;
  const TimerSettingsHistorySheet({required this.profileId, super.key});

  void _close(BuildContext context) {
    context.hapticsTap();
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.sizeOf(context).height * 0.6;

    return BlocProvider<TimerSettingsHistoryCubit>(
      create: (_) =>
          GetIt.I.get<TimerSettingsHistoryCubit>()..loadSettings(profileId),
      child: Builder(
        builder: (context) => InputView(
          title: TimerLocalizations.of(context).timerSettingsHistory,
          actionLabel: context.coreL10n.close,
          onSave: () => _close(context),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child:
              BlocBuilder<TimerSettingsHistoryCubit, TimerSettingsHistoryState>(
                builder: buildBody
              ),
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, TimerSettingsHistoryState state) {
    final l10n = TimerLocalizations.of(context);

    switch (state) {
      case TimerSettingsHistoryLoaded(:final timerSettingsList):
        if (timerSettingsList.isEmpty) {
          return _message(context, l10n.timerSettingsHistoryEmpty);
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: DesignSpec.paddingLg),
          child: ShaderMask(
            blendMode: BlendMode.dstIn,
            shaderCallback: (bounds) {
              final fade = _fadeExtent / bounds.height;
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0, fade, 1 - fade, 1],
              ).createShader(bounds);
            },
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(DesignSpec.paddingLg),
                    child: Text(
                      l10n.timerSettingsHistorySubtitle,
                      style: context.theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                    left: DesignSpec.paddingLg,
                    right: DesignSpec.paddingLg,
                    bottom: DesignSpec.paddingLg + _fadeExtent,
                  ),
                  sliver: TimerSettingsHistoryGrid(
                    profileId: profileId,
                    timerSettingsHistoryRecordList: timerSettingsList,
                    onApplied: () =>
                        Navigator.of(context, rootNavigator: true).pop(),
                  ),
                ),
              ],
            ),
          ),
        );
      case TimerSettingsHistoryError():
        return _message(context, context.coreL10n.errorHeadline);
      default:
        return Center(child: CircularProgressIndicator());
    }
  }

  Widget _message(BuildContext context, String text) => Padding(
    padding: const EdgeInsets.all(DesignSpec.paddingLg),
    child: Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: context.theme.textTheme.titleMedium,
      ),
    ),
  );
}
