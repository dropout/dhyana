import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/chant.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_button.dart';
import 'package:flutter/material.dart';

class ChantingSettingsView extends StatelessWidget {

  final List<Chant> chants;
  final void Function(int oldIndex, int newIndex) onReorder;
  final void Function()? onStart;
  final String? title;

  const ChantingSettingsView({
    required this.chants,
    required this.onReorder,
    this.onStart,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double horizontalPadding =
          (constraints.maxWidth >= 520.0)
            ? DesignSpec.padding4Xl
            : DesignSpec.paddingLg;

        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    DesignSpec.padding2Xl,
                    horizontalPadding,
                    DesignSpec.paddingXl,
                  ),
                  child: _ChantList(
                    chants: chants,
                    title: title,
                    onReorder: onReorder,
                  ),
                ),
              ),
              _StartButton(
                onTap: onStart,
              ),
            ],
          ),
        );
      },
    );
  }

}

class _ChantList extends StatelessWidget {

  final List<Chant> chants;
  final void Function(int oldIndex, int newIndex) onReorder;
  final String? title;

  const _ChantList({
    required this.chants,
    required this.onReorder,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: DesignSpec.paddingLg),
            child: Text(
              title ?? '',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        Expanded(
          child: ReorderableListView.builder(
            buildDefaultDragHandles: false,
            itemCount: chants.length,
            onReorder: (oldIndex, newIndex) {
              final int adjustedIndex =
                (newIndex > oldIndex) ? newIndex - 1 : newIndex;
              onReorder(oldIndex, adjustedIndex);
            },
            itemBuilder: (context, index) {
              final chant = chants[index];
              return _ChantListItem(
                key: ValueKey(chant.id),
                chant: chant,
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }

}

class _ChantListItem extends StatelessWidget {

  final Chant chant;
  final int index;

  const _ChantListItem({
    required this.chant,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(bottom: DesignSpec.paddingSm),
        child: ListTile(
          tileColor: Colors.black.withValues(alpha: 0.06),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignSpec.borderRadiusMd),
          ),
          title: Text(
            chant.name,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          trailing: ReorderableDragStartListener(
            index: index,
            child: const Icon(Icons.drag_handle),
          ),
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
          text: AppLocalizations.of(context).startTimerButtonText,
          buttonSize: AppButtonSize.large,
          onTap: onTap,
        ),
      ),
    );
  }

}

