import 'package:dhyana/bloc/chanting_settings/chanting_settings_cubit.dart';
import 'package:dhyana/model/chant.dart';
import 'package:dhyana/model/chanting_settings.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_chant_sheet.dart';

class ChantingSettingsView extends StatelessWidget {

  final List<Chant> availableChants;

  const ChantingSettingsView({
    required this.availableChants,
    super.key,
  });

  void _triggerAddChantSheet(BuildContext context, List<Chant> availableChants) {
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
        )
      ),
    );
  }

  void _onChantSelected(BuildContext context, Chant chant) {
    context.read<ChantingSettingsCubit>().addToSelectedChants(chant);
  }

  void _onReorderSelectedChants(BuildContext context, int oldIndex, int newIndex) {
    context.read<ChantingSettingsCubit>().reorderSelectedChants(oldIndex, newIndex);
  }

  void _onChantRemoved(BuildContext context, Chant chant) {
    context.read<ChantingSettingsCubit>().removeFromSelectedChants(chant);
  }

  void _onStart(BuildContext context) {
    final selectedChants = context.read<ChantingSettingsCubit>().state.selectedChants;
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
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingLg, vertical: DesignSpec.padding2Xl),
                child: _ChantList(
                  chants: state.selectedChants,
                  onAddChant: () => _triggerAddChantSheet(context, availableChants),
                  onChantRemoved: (chant) => _onChantRemoved(context, chant),
                  onReorder: (oldIndex, newIndex) =>
                    _onReorderSelectedChants(context, oldIndex, newIndex),
                ),
            ),
          ),
          _StartButton(
            onTap: () => _onStart(context),
          ),
        ],
      ),
    );
  }


}

class _ChantList extends StatelessWidget {

  final List<Chant> chants;
  final void Function(int oldIndex, int newIndex) onReorder;
  final VoidCallback onAddChant;
  final void Function(Chant) onChantRemoved;

  const _ChantList({
    required this.chants,
    required this.onReorder,
    required this.onAddChant,
    required this.onChantRemoved,
  });

  @override
  Widget build(BuildContext context) {
    if (chants.isEmpty) {
      return buildEmpty(context);
    }

    return ReorderableListView.builder(
      physics: ClampingScrollPhysics(),
      buildDefaultDragHandles: false,
      itemCount: chants.length,
      onReorder: (oldIndex, newIndex) {
        final int adjustedIndex =
          (newIndex > oldIndex) ? newIndex - 1 : newIndex;
        onReorder(oldIndex, adjustedIndex);
      },
      footer: Padding(
        padding: const EdgeInsets.symmetric(vertical: DesignSpec.paddingLg),
        child: SizedBox.shrink( // to prevent stretching of the button
          child: AddChantButton(
            onTap: onAddChant,
          ),
        ),
      ),
      itemBuilder: (context, index) {
        final chant = chants[index];
        return _ChantListItem(
          key: ObjectKey(chant.id),
          chant: chant,
          index: index,
          enableDragging: chants.length > 1, // disable dragging if there's only one item
          onDismiss: () => onChantRemoved(chant),
        );
      },
      proxyDecorator: (child, index, animation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Material(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha((animation.value * 40).toInt()),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.white.withAlpha((animation.value * 50).toInt()),
                  ),
                ),
                child: child,
              ),
            );
          },
          child: child,
        );
      },
    );

  }

  Widget buildEmpty(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DesignSpec.paddingLg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No chants added yet.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          Gap.small(),
          Text(
            'Tap the + button to add chants to your session.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          Gap.small(),
          AddChantButton(
            onTap: onAddChant,
          )
        ],
      ),
    );
  }

}

class _ChantListItem extends StatelessWidget {

  final Chant chant;
  final int index;
  final bool enableDragging;
  final VoidCallback onDismiss;

  const _ChantListItem({
    required this.chant,
    required this.index,
    required this.onDismiss,
    this.enableDragging = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(chant.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismiss(),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignSpec.borderRadiusMd),
        ),
        title: Text(
          '${index + 1}. ${chant.name}',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: ReorderableDragStartListener(
          enabled: enableDragging,
          index: index,
          child: enableDragging
            ? const Icon(Icons.drag_handle)
            : const SizedBox.shrink(),
        ),
      ),
    );
  }

}

class _StartButton extends StatelessWidget {

  final void Function()? onTap;

  const _StartButton({
    this.onTap,
  });

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

class AddChantButton extends StatelessWidget {

  final VoidCallback onTap;

  const AddChantButton({
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 56,
      color: Colors.black,
      icon: const Icon(Icons.add_circle),
      onPressed: onTap,
    );
  }
}
