import 'package:collection/collection.dart';
import 'package:dhyana/model/presence.dart';
import 'package:dhyana/modules/social/presentation/widget/presence_list_item.dart';
import 'package:dhyana/core/presentation/widget/util/app_animation.dart';
import 'package:flutter/material.dart';

class PresenceTable extends StatelessWidget {

  final List<Presence> presenceList;
  final int columnCount;
  final Color textColor;

  const PresenceTable({
    required this.presenceList,
    this.columnCount = 3,
    this.textColor = Colors.black,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    List<List<Presence>> slicedPresenceList =
      presenceList.slices(columnCount).toList();
    return Table(
      children: List.generate(slicedPresenceList.length, (rowIndex) =>
        TableRow(
          children: List.generate(columnCount, (columnIndex) {
            if (columnIndex < slicedPresenceList[rowIndex].length) {
              return TableCell(
                child: PresenceListItem(
                  borderColor: Colors.grey,
                  textColor: textColor,
                  presence: slicedPresenceList[rowIndex][columnIndex],
                ).gridReveal(rowIndex, columnIndex),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
        )
      ),
    );
  }

}
