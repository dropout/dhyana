import 'package:dhyana/model/chant.dart';
import 'package:dhyana/widget/chanting/chant_card.dart';
import 'package:dhyana/widget/chanting/settings/add_chant_button.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

class ChantList extends StatelessWidget {
  final List<ChantViewModel> chants;
  final void Function(int oldIndex, int newIndex) onReorder;
  final VoidCallback onAddChant;
  final void Function(ChantViewModel, int) onChantRemoved;

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

    return ClipRRect(
      borderRadius: BorderRadius.circular(DesignSpec.borderRadiusMd),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.backgroundPaper,
          borderRadius: BorderRadius.circular(DesignSpec.borderRadiusMd),
          // border: Border.all(color: AppColors.backgroundPaperDark, width: 2),
          border: Border.all(color: Colors.black, width: 2, strokeAlign: 2),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: AppColors.backgroundPaperDark,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DesignSpec.paddingMd,
                  ),
                  child: buildList(context),
                ),
              ),
            ),

            Positioned(
              top: -30, // Hidden 30 pixels above the card
              left: -30, // Stretch past the corners to prevent corner gaps
              right: -30,
              height: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black, // Box needs a color to cast a shadow
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 20,
                      offset: const Offset(
                        0,
                        15,
                      ), // Pushes the shadow DOWN into the card
                    ),
                  ],
                ),
              ),
            ),

            // 4. The LEFT Shadow Caster
            Positioned(
              left: -40, // Hidden 30 pixels to the left of the card
              top: -40,
              bottom: -40,
              width: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 20,
                      offset: const Offset(
                        15,
                        0,
                      ), // Pushes the shadow RIGHT into the card
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildList(BuildContext context) {
    return ReorderableListView.builder(
      padding: EdgeInsets.symmetric(vertical: DesignSpec.paddingMd),
      buildDefaultDragHandles: false,
      itemCount: chants.length,
      onReorderItem: (oldIndex, newIndex) =>
        onReorder(oldIndex, newIndex),
      
      footer: Padding(
        padding: const EdgeInsets.symmetric(vertical: DesignSpec.paddingXl),
        child: Center(child: AddChantButton(onTap: onAddChant)),
      ),
      itemBuilder: (context, index) {
        final chant = chants[index];
        final enableDragging = chants.length > 1;
        final paddingBottom = index < chants.length - 1
            ? DesignSpec.paddingSm
            : 0.0;

        return Dismissible(
          key: ValueKey(chant.uniqueId),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => onChantRemoved(chant, index),
          child: Padding(
            padding: EdgeInsets.only(bottom: paddingBottom),
            child: ChantCard(
              key: ValueKey(chant.uniqueId),
              index: index,
              chantViewModel: chant,
              trailing: SizedBox.square(
                dimension: 48,
                child: ReorderableDragStartListener(
                  enabled: enableDragging,
                  index: index,
                  child: enableDragging
                      ? const Icon(Icons.drag_handle)
                      : const SizedBox.shrink(),
                ),
              ),
            ),
          ),
        );
      },
      proxyDecorator: (child, index, animation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? animatedChild) {
            return Material(
              color: Colors.transparent,
              child: animatedChild,
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
