import 'package:dhyana/model/chant.dart';
import 'package:dhyana/widget/chanting/chant_card.dart';
import 'package:dhyana/widget/chanting/settings/add_chant_button.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

class ChantList extends StatefulWidget {
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
  State<ChantList> createState() => _ChantListState();
}

class _ChantListState extends State<ChantList> {
  late List<_ChantingListItem> _chants;

  /// Generate unique keys once for each chant to avoid issues with reordering 
  /// and dismissing items.
  /// The keys will be reused in widget builds to ensure that the correct items are updated and removed.
  @override
  void initState() {
    super.initState();
    _chants = widget.chants.map((e) => 
    _ChantingListItem(chant: e, key: UniqueKey())).toList();
  }

  /// Update unique keys for the chants when the list of chants changes.
  /// This ensures that the correct items are updated and removed when the list changes.
  @override
  void didUpdateWidget(ChantList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.chants != widget.chants) {
      debugPrint('List of chants has changed. Updating _chants with new keys.');
      setState(() {
        _chants = widget.chants.map((e) => _ChantingListItem(chant: e, key: UniqueKey())).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_chants.isEmpty) {
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
                  padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingMd),
                  child: buildList(context),
                )
              ),
            ),

            Positioned(
              top: -30,     // Hidden 30 pixels above the card
              left: -30,    // Stretch past the corners to prevent corner gaps
              right: -30,
              height: 30,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black, // Box needs a color to cast a shadow
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 15), // Pushes the shadow DOWN into the card
                    ),
                  ],
                ),
              ),
            ),

            // 4. The LEFT Shadow Caster
            Positioned(
              left: -40,    // Hidden 30 pixels to the left of the card
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
                      offset: const Offset(15, 0), // Pushes the shadow RIGHT into the card
                    ),
                  ],
                ),
              ),
            ),


            // Container(              
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(DesignSpec.borderRadiusMd),
            //     // color: AppColors.charcoal,
            //     boxShadow: [
            //       BoxShadow(
            //         // color: AppColors.backgroundPaper.withValues(alpha: 1.0),
            //         // color: Colors.transparent.withValues(alpha: 1.0),
            //         color: Colors.black.withValues(alpha: 0.0),
            //         blurRadius: 0,
            //         offset: const Offset(0, 0),
            //         spreadRadius: 0,
            //       ),
            //       BoxShadow(
            //         // color: Colors.black.withValues(alpha: 0.9),
            //         // color: Colors.transparent.withValues(alpha: 1.0),
            //         color: AppColors.backgroundPaper.withValues(alpha: .5),
            //         // color: Colors.black.withValues(alpha: 0.0),
            //         blurRadius: 10,
            //         offset: const Offset(10, 10),
            //         spreadRadius: 4,
            //       ),
            //       // BoxShadow(
            //       //   // color: Colors.black.withValues(alpha: 0.9),
            //       //   color: AppColors.backgroundPaperLight.withValues(alpha: 1.0),
            //       //   blurRadius: 10,
            //       //   offset: const Offset(0, 0),
            //       //   spreadRadius: -10,
            //       // ),

            //     ],
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingMd),
            //     child: buildList(context),
            //   ),
            //   // child: Container(
            //   //   // color: AppColors.backgroundPaperDark,
            //   // )
            // )
            

            // Padding(
            //   padding: const EdgeInsets.all(DesignSpec.paddingMd),
            //   child: ReorderableListView.builder(
            //     buildDefaultDragHandles: false,
            //     itemCount: _chants.length,
            //     onReorderItem: (oldIndex, newIndex) {
            //       final int adjustedIndex = (newIndex > oldIndex)
            //           ? newIndex - 1
            //           : newIndex;
            //       widget.onReorder(oldIndex, adjustedIndex);
            //     },
            //     footer: Padding(
            //       padding: const EdgeInsets.symmetric(vertical: DesignSpec.paddingXl),
            //       child: Center(child: AddChantButton(onTap: widget.onAddChant)),
            //     ),
            //     itemBuilder: (context, index) {
            //       final chant = _chants[index].chant;
            //       final enableDragging = _chants.length > 1;
            //       final paddingBottom = index < _chants.length - 1
            //           ? DesignSpec.paddingSm
            //           : 0.0;
              
            //       return Dismissible(
            //         key: _chants[index].key,
            //         direction: DismissDirection.endToStart,
            //         onDismissed: (_) => widget.onChantRemoved(chant, index),
            //         child: Padding(
            //           padding: EdgeInsets.only(bottom: paddingBottom),
            //           child: ChantCard(
            //             index: index,
            //             chant: chant,
            //             trailing: ReorderableDragStartListener(
            //               enabled: enableDragging,
            //               index: index,
            //               child: enableDragging
            //                 ? const Icon(Icons.drag_handle)
            //                 : const SizedBox.shrink(),
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //     proxyDecorator: (child, index, animation) {
            //       return AnimatedBuilder(
            //         animation: animation,
            //         builder: (BuildContext context, Widget? child) {
            //           return Material(
            //             color: Colors.transparent,
            //             child: Container(
            //               decoration: BoxDecoration(
            //                 color: Colors.white.withAlpha((animation.value * 40).toInt()),
            //                 borderRadius: BorderRadius.circular(8),
            //                 border: Border.all(
            //                   color: Colors.white.withAlpha(
            //                     (animation.value * 50).toInt(),
            //                   ),
            //                 ),
            //               ),
            //               child: child,
            //             ),
            //           );
            //         },
            //         child: ChantCard(
            //           index: index,
            //           chant: _chants[index].chant,              
            //         ),
            //       );
            //     },
            //   ),
            // ),


            // Positioned.fill(
            //   child: IgnorePointer(
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(DesignSpec.borderRadiusMd),
            //         // border: Border.all(color: Colors.grey[300]!, width: 0),
            //         boxShadow: [
            //           // BoxShadow(
            //           //   color: Colors.black.withValues(alpha: 0.3),
            //           //   blurRadius: 20,
            //           //   offset: const Offset(3, 3),
            //           //   spreadRadius: -4, // Negative spread pulls it inward
            //           // ),
            //           BoxShadow(
            //             color: AppColors.backgroundPaper.withValues(alpha: 0.1),
            //             blurRadius: 10,
            //             offset: const Offset(3, 3),
            //             spreadRadius: -4,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

          ],
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, ) {
    return ReorderableListView.builder(
      padding: EdgeInsets.symmetric(vertical: DesignSpec.paddingMd),
      buildDefaultDragHandles: false,
      itemCount: _chants.length,
      onReorderItem: (oldIndex, newIndex) {
        final int adjustedIndex = (newIndex > oldIndex)
            ? newIndex - 1
            : newIndex;
        widget.onReorder(oldIndex, adjustedIndex);
      },
      footer: Padding(
        padding: const EdgeInsets.symmetric(vertical: DesignSpec.paddingXl),
        child: Center(child: AddChantButton(onTap: widget.onAddChant)),
      ),
      itemBuilder: (context, index) {
        final chant = _chants[index].chant;
        final enableDragging = _chants.length > 1;
        final paddingBottom = index < _chants.length - 1
            ? DesignSpec.paddingSm
            : 0.0;

        return Dismissible(
          key: _chants[index].key,
          direction: DismissDirection.endToStart,
          onDismissed: (_) => widget.onChantRemoved(chant, index),
          child: Padding(
            padding: EdgeInsets.only(bottom: paddingBottom),
            child: ChantCard(
              index: index,
              chant: chant,
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
          builder: (BuildContext context, Widget? child) {
            return Material(
              color: Colors.transparent,
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
          child: ChantCard(
            index: index,
            chant: _chants[index].chant,              
          ),
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
          AddChantButton(onTap: widget.onAddChant),
        ],
      ),
    );
  }
}

class _ChantingListItem {
  final Chant chant;
  final UniqueKey key;

  _ChantingListItem({required this.chant, required this.key});
}
