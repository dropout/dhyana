import 'package:chanting/l10n/chanting_localizations.dart';
import 'package:chanting/src/public/view/chanting_settings/chant_list.dart';
import 'package:core/core.dart';
import 'package:chanting/src/chanting_routes.dart';
import 'package:chanting/src/public/model/chant.dart';
import 'package:chanting/src/public/model/chant_playlist_item.dart';
import 'package:chanting/src/public/model/chanting_settings.dart';
import 'package:chanting/src/public/viewmodel/chanting_settings_cubit.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'add_chant_sheet.dart';

class ChantingSettingsView extends StatelessWidget {

  static Widget withCubit() {
    return SmartBlocProvider<ChantingSettingsCubit, ChantingSettingsState>(
      key: const ValueKey('chanting_settings_cubit'),
      create: (context) => GetIt.I.get<ChantingSettingsCubit>()
        ..loadAvailableChants(),
      builder: (context, state) => ChantingSettingsView(
        availableChants: state.availableChants,
      ),
    );
  }

  final List<Chant> availableChants;

  const ChantingSettingsView({
    required this.availableChants,
    super.key,
  });

  String getTotalDurationText(BuildContext context, ChantingSettingsState state) {    
    final totalDuration = state.playlist.fold<Duration>(
      Duration.zero,
      (previousValue, chantViewModel) => previousValue + chantViewModel.duration,
    );
    final minutes = totalDuration.inMinutes;
    return ChantingLocalizations.of(context).minutesPluralWithNumber(minutes).toUpperCase();
  }

  void _triggerAddChantSheet(
    BuildContext context,
    List<Chant> availableChants,
  ) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      useSafeArea: true,
      backgroundColor: AppColors.backgroundPaper,
      showDragHandle: false,
      enableDrag: false,
      builder: (bottomSheetContext) => SizedBox(
        height: MediaQuery.of(bottomSheetContext).size.height - 120,
        child: AddChantSheet(
          availableChants: availableChants,
          onChantSelected: (chant) => _onChantSelected(context, chant),
        ),
      ),
    );
    context.hapticsTap();
  }

  void _onChantSelected(BuildContext context, Chant chant) {
    context.read<ChantingSettingsCubit>().addToPlaylist(chant);
  }

  void _onReorderSelectedChants(
    BuildContext context,
    int oldIndex,
    int newIndex,
  ) {
    context.read<ChantingSettingsCubit>().reorderPlaylist(oldIndex, newIndex);
  }

  void _onChantRemoved(
    BuildContext context,
    ChantPlaylistItem chantViewModel,
    int index,
  ) {
    context.read<ChantingSettingsCubit>().removeFromPlaylist(index);
  }

  void _onStart(BuildContext context) {
    final selectedChants = context.read<ChantingSettingsCubit>().state.playlist;
    if (selectedChants.isNotEmpty) {
      ChantingRoute(
        $extra: ChantingSettings(selectedChants: selectedChants),
      ).push(context);
      context.hapticsTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChantingSettingsCubit, ChantingSettingsState>(
      builder: (context, state) {
        return switch (state.isLoading) {
          true => const AppLoadingDisplay(),
          false => buildLoaded(context, state),
        };
      },
    );
  }

  Widget buildLoaded(BuildContext context, ChantingSettingsState state) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Gap.medium(),
          Text(
            ChantingLocalizations.of(context).chantingTitle,
            style: context.theme.textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          Gap.medium(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: DesignSpec.paddingLg,
                right: DesignSpec.paddingLg,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: DesignSpec.maxContentWidth,
                ),
                child: ChantList(
                  chants: state.playlist,
                  onAddChant: () =>
                      _triggerAddChantSheet(context, availableChants),
                  onChantRemoved: (chant, index) =>
                      _onChantRemoved(context, chant, index),
                  onReorder: (oldIndex, newIndex) =>
                      _onReorderSelectedChants(context, oldIndex, newIndex),
                ),
              ),
            ),
          ),
          if (state.playlist.isNotEmpty) Padding(
            padding: const EdgeInsets.only(
              left: DesignSpec.paddingXl,
              right: DesignSpec.paddingXl,
              top: DesignSpec.paddingXs,
              bottom: DesignSpec.paddingXl,
            ),
            child: Row(
              mainAxisAlignment: .center,
              children: [
                Text(
                  '${getTotalDurationText(context, state)} ${ChantingLocalizations.of(context).statsTotal.toUpperCase()}',
                  style: context.theme.textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: DesignSpec.paddingLg),
            child: SessionStartButton(
              onTap: () => _onStart(context),
              colorA: AppColors.crimsonRed,
              colorB: Color(0xFFD93838), // Crimson Red Tint 3
            ),
          ),
        ],
      ),
    );
  }
}
