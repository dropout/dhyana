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

  @override
  void initState() {
    super.initState();
    _chants = widget.chants.map((e) => 
    _ChantingListItem(chant: e, key: UniqueKey())).toList();
  }

  @override
  void didUpdateWidget(ChantList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.chants != widget.chants) {
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

    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      itemCount: _chants.length,
      onReorder: (oldIndex, newIndex) {
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
