import 'package:dhyana/modules/practice/chanting/domain/model/chant.dart';
import 'package:dhyana/util/remap_range.dart';
import 'package:dhyana/modules/practice/chanting/presentation/widget/chant_card.dart';
import 'package:dhyana/modules/practice/chanting/presentation/widget/settings/add_chant_button.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/widget/util/app_context.dart';
import 'package:dhyana/core/presentation/widget/util/gap.dart';
import 'package:dhyana/core/presentation/widget/util/inset_surface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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

    return InsetSurface(
      padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingMd),
      child: buildList(context),
    );
  }

  Widget buildList(BuildContext context) {
    return ReorderableListView.builder(
      padding: EdgeInsets.symmetric(vertical: DesignSpec.paddingMd),
      buildDefaultDragHandles: false,
      itemCount: chants.length,
      onReorderItem: (oldIndex, newIndex) => onReorder(oldIndex, newIndex),

      footer: Padding(
        padding: const EdgeInsets.symmetric(vertical: DesignSpec.paddingXl),
        child: Center(child: AddChantButton(onTap: onAddChant)),
      ),
      itemBuilder: (context, index) =>
        buildPlaylistItem(context, chants[index], index),      
      proxyDecorator: (child, index, animation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? animatedChild) {
            return Material(color: Colors.transparent, child: animatedChild);
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

  Widget buildPlaylistItem(
    BuildContext context,
    ChantViewModel chant,
    int index,
  ) {
    final enableDragging = chants.length > 1;
    final isLast = index == chants.length - 1;
    final paddingBottom = index < chants.length - 1
        ? DesignSpec.paddingSm
        : 0.0;

    return Slidable(
      closeOnScroll: true,
      key: ValueKey(chant.uniqueId),
      endActionPane: ActionPane(      
        motion: const ScrollMotion(),
        extentRatio: 0.25,        
        children: [
          CustomSlidableAction(
            onPressed: (_) { 
              onChantRemoved(chant, index);
              context.hapticsTap();
            },
            backgroundColor: Colors.transparent,
            // foregroundColor: Colors.white,
            padding: EdgeInsets.only(
              left: DesignSpec.paddingSm,
              // right: DesignSpec.paddingSm,
              bottom: isLast ? 0.0 : DesignSpec.paddingSm,
            ),
            child: const DynamicSlideActionIcon(),
          ),
        ],
      ),
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
    
  }
}

class DynamicSlideActionIcon extends StatelessWidget {
  const DynamicSlideActionIcon({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Grab the closest SlidableController from the context hierarchy
    final slidableController = Slidable.of(context);

    if (slidableController == null) {
      return const SizedBox.shrink();
    }

    // 2. Use AnimatedBuilder to rebuild your icon based on the slide amount
    return AnimatedBuilder(
      animation: slidableController.animation,      
      builder: (context, child) {
        
        // goes from 0.0 (closed) to 0.25 (button visible)
        final slideValue = slidableController.animation.value;

        // value goes from 0.0 (closed) to 1.0
        final animationValue = slideValue.remapAndClamp(0.0, 0.25, 0.0, 1.0).toDouble();

        return Opacity(
          opacity: animationValue, // Fade in the icon as it slides
          child: Transform.scale(
            scale: animationValue, // Scale the icon up to 150% size
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(DesignSpec.borderRadiusLg),
                ),
                color: context.theme.colorScheme.error,
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 28,
                    
              ),
            ),
          ),
        );
      },
    );
  }
}


