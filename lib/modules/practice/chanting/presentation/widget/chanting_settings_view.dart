import 'package:dhyana/modules/practice/chanting/presentation/bloc/chanting_settings/chanting_settings_cubit.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/chant.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/chanting_settings.dart';
import 'package:dhyana/modules/account/domain/model/profile_settings.dart';
import 'package:dhyana/util/assets.dart';
import 'package:dhyana/core/navigation/app_routes.dart';
import 'package:dhyana/modules/practice/chanting/presentation/widget/settings/chant_list.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/widget/session/session_start_button.dart';
import 'package:dhyana/core/presentation/util/app_context.dart';
import 'package:dhyana/core/presentation/util/app_loading_display.dart';
import 'package:dhyana/core/presentation/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings/add_chant_sheet.dart';

class ChantingSettingsView extends StatelessWidget {
  final List<Chant> availableChants;
  final ProfileSettings profileSettings;

  const ChantingSettingsView({
    required this.profileSettings,
    required this.availableChants,
    super.key,
  });

  String getTotalDurationText(BuildContext context, ChantingSettingsState state) {    
    final totalDuration = state.playlist.fold<Duration>(
      Duration.zero,
      (previousValue, chantViewModel) => previousValue + chantViewModel.chant.length,
    );
    final minutes = totalDuration.inMinutes;
    return context.l10n.minutesPluralWithNumber(minutes).toUpperCase();
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
    ChantViewModel chantViewModel,
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
            context.l10n.chantingTitle,
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
                  '${getTotalDurationText(context, state)} ${context.l10n.statsTotal.toUpperCase()}',
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
              fragmentShader: context.services.shaderService.get(
                Assets.shaderGradientFlow,
              ),
              colorA: AppColors.crimsonRed,
              colorB: Color(0xFFD93838), // Crimson Red Tint 3
            ),
          ),
        ],
      ),
    );
  }
}
