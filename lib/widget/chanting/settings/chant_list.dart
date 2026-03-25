import 'package:dhyana/model/chant.dart';
import 'package:dhyana/widget/chanting/chant_card.dart';
import 'package:dhyana/widget/chanting/settings/add_chant_button.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

class ChantList extends StatelessWidget {
  final List<Chant> chants;
  final void Function(int oldIndex, int newIndex) onReorder;
  final VoidCallback onAddChant;
  final void Function(Chant, int) onChantRemoved;

  const ChantList({
    required this.chants,
    required this.onReorder,
    required this.onAddChant,
    required this.onChantRemoved,
    super.key,
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
        final int adjustedIndex = (newIndex > oldIndex)
            ? newIndex - 1
            : newIndex;
        onReorder(oldIndex, adjustedIndex);
      },
      footer: Padding(
        padding: const EdgeInsets.symmetric(vertical: DesignSpec.paddingLg),
        child: Center(
          // Drop parent constraints stretching full width
          child: AddChantButton(onTap: onAddChant),
        ),
      ),
      itemBuilder: (context, index) {
        final chant = chants[index];
        final enableDragging = chants.length > 1;
        final paddingBottom = index < chants.length - 1
            ? DesignSpec.paddingSm
            : 0.0;

        return Dismissible(        
          key: ValueKey('${chant.id}.$index'),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => onChantRemoved(chant, index),
          child: Padding(
            padding: EdgeInsets.only(bottom: paddingBottom),
            child: ChantCard(
              index: index,
              chant: chant,
              trailing: ReorderableDragStartListener(
                enabled: enableDragging,
                index: index,
                child: enableDragging
                    ? const Icon(Icons.drag_handle)
                    : const SizedBox.shrink(),
              ),
            ),
          ),
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
                    color: Colors.white.withAlpha(
                      (animation.value * 50).toInt(),
                    ),
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
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w800),
          ),
          Gap.small(),
          Text(
            'Tap the + button to add chants to your session.',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800),
          ),
          Gap.small(),
          AddChantButton(onTap: onAddChant),
        ],
      ),
    );
  }
}