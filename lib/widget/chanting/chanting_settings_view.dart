import 'package:dhyana/bloc/chanting_settings/chanting_settings_cubit.dart';
import 'package:dhyana/model/chant.dart';
import 'package:dhyana/model/chanting_settings.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/chanting/settings/chant_list.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings/add_chant_sheet.dart';

class ChantingSettingsView extends StatelessWidget {
  final List<Chant> availableChants;

  const ChantingSettingsView({required this.availableChants, super.key});

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
      builder: (bottomSheetContext) => SizedBox(
        height: MediaQuery.of(bottomSheetContext).size.height * 0.75,
        child: AddChantSheet(
          availableChants: availableChants,
          onChantSelected: (chant) => _onChantSelected(context, chant),
        ),
      ),
    );
  }

  void _onChantSelected(BuildContext context, Chant chant) {
    context.read<ChantingSettingsCubit>().addToSelectedChants(chant);
  }

  void _onReorderSelectedChants(
    BuildContext context,
    int oldIndex,
    int newIndex,
  ) {
    context.read<ChantingSettingsCubit>().reorderSelectedChants(
      oldIndex,
      newIndex,
    );
  }

  void _onChantRemoved(BuildContext context, Chant chant) {
    context.read<ChantingSettingsCubit>().removeFromSelectedChants(chant);
  }

  void _onStart(BuildContext context) {
    final selectedChants = context
        .read<ChantingSettingsCubit>()
        .state
        .selectedChants;
    if (selectedChants.isNotEmpty) {
      ChantingRoute(
        $extra: ChantingSettings(selectedChants: selectedChants),
      ).push(context);
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
            'Chanting',
            style: Theme.of(
              context,
            ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w800),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DesignSpec.paddingLg,
                vertical: DesignSpec.padding2Xl,
              ),
              child: ChantList(
                chants: state.selectedChants,
                onAddChant: () =>
                    _triggerAddChantSheet(context, availableChants),
                onChantRemoved: (chant) => _onChantRemoved(context, chant),
                onReorder: (oldIndex, newIndex) =>
                    _onReorderSelectedChants(context, oldIndex, newIndex),
              ),
            ),
          ),
          _StartButton(onTap: () => _onStart(context)),
        ],
      ),
    );
  }
}

class _StartButton extends StatelessWidget {
  final void Function()? onTap;

  const _StartButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: DesignSpec.paddingLg),
        child: AppButton(
          text: context.l10n.startTimerButtonText.toUpperCase(),
          buttonSize: AppButtonSize.large,
          onTap: onTap,
        ),
      ),
    );
  }
}
