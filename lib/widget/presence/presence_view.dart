import 'package:collection/collection.dart';
import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/widget/presence/all.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PresenceView extends StatelessWidget {
  const PresenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PresenceBloc, PresenceState>(
      builder: (BuildContext context, PresenceState state) {
        switch (state) {
          case PresenceLoadingState():
            return const Text('loading');
          case PresenceLoadedState():
            return buildLoaded(context, state.presenceList);
          case PresenceErrorState():
            return const Text('error');
          default:
            return SizedBox.shrink();
        }
      },
    );
  }

  Widget buildAnimatedLoaded(BuildContext context, List<Presence> presenceList) {
    List<List<Presence>> slicedPresenceList = presenceList.slices(3).toList();
    return Table(
      children: [
        ...List.generate(slicedPresenceList.length, (rowIndex) =>
          TableRow(
            children: List.generate(3, (columnIndex) {
              if (columnIndex < slicedPresenceList[rowIndex].length) {
                return TableCell(
                  child: Container(
                    child: PresenceListItem(presence: slicedPresenceList[rowIndex][columnIndex]).reveal(100),
                  )
                  // child: PresenceListItem(presence: slicedPresenceList[rowIndex][columnIndex]),
                  // child: AnimatedOpacity(
                  //   opacity: 1.0,
                  //   duration: Duration(milliseconds: 512),
                  //   child: PresenceListItem(presence: slicedPresenceList[rowIndex][columnIndex])
                  // ),
                );
              } else {
                return const TableCell(child: SizedBox.shrink());
              }
            }),
          )
        ),


        // ...slicedPresenceList.map((presenceSlice) => TableRow(
        //   children: [
        //     ...List.generate(3, (index) => index).map((index) {
        //       if (index < presenceSlice.length) {
        //         return TableCell(
        //             child: PresenceListItem(presence: presenceSlice[index])
        //         );
        //       } else {
        //         return const TableCell(child: SizedBox.shrink());
        //       }
        //     }),
        //   ],
        // )),
      ],
    );
  }

  Widget buildLoaded(BuildContext context, List<Presence> presenceList) {
    List<List<Presence>> slicedPresenceList = presenceList.slices(3).toList();
    return Table(
      children: [
        ...slicedPresenceList.map((presenceSlice) => TableRow(
          children: [
            ...List.generate(3, (index) => index).map((index) {
              if (index < presenceSlice.length) {
                return TableCell(
                  child: PresenceListItem(presence: presenceSlice[index])
                );
              } else {
                return const TableCell(child: SizedBox.shrink());
              }
            }),
          ],
        )),
      ],
    );
  }

}
