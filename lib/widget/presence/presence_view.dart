import 'package:collection/collection.dart';
import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/widget/presence/all.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PresenceView extends StatelessWidget {

  final int batchSize;
  final int maxPageCount;

  const PresenceView({
    required this.batchSize,
    this.maxPageCount = 3,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PresenceBloc, PresenceState>(
      builder: (BuildContext context, PresenceState state) {
        switch (state) {
          case PresenceLoadingState():
            return const Text('loading');
          case PresenceLoadedState():
            return buildLoaded(context, state.presenceList);
          case PresenceLoadingMoreState():
            return buildLoaded(context, state.presenceList);
          case PresenceErrorState():
            return const Text('error');
          default:
            return SizedBox.shrink();
        }
      },
    );
  }

  Widget buildLoaded(BuildContext context, List<Presence> presenceList) {
    return Column(
      children: [
        buildTable(context, presenceList),
        buildLoadMoreButton(context, presenceList),
      ],
    );
  }

  Widget buildTable(BuildContext context, List<Presence> presenceList) {
    List<List<Presence>> slicedPresenceList = presenceList.slices(3).toList();
    return Table(
      children: [
        ...List.generate(slicedPresenceList.length, (rowIndex) =>
            TableRow(
              children: List.generate(3, (columnIndex) {
                if (columnIndex < slicedPresenceList[rowIndex].length) {
                  return TableCell(
                    child: Container(
                      child: PresenceListItem(
                        presence: slicedPresenceList[rowIndex][columnIndex])
                          .gridReveal(rowIndex,columnIndex),
                    )
                  );
                } else {
                  return const TableCell(child: SizedBox.shrink());
                }
              }),
            )
        ),
      ],
    );
  }

  Widget buildLoadMoreButton(BuildContext context, List<Presence> presenceList) {
    return BlocBuilder<PresenceBloc, PresenceState>(
      builder: (BuildContext context, PresenceState state) {
        switch (state) {
          case PresenceLoadingState():
            return SizedBox.shrink();
          case PresenceLoadedState():
            return LoadMoreButton(
              text: AppLocalizations.of(context).loadMore,
              presenceList: presenceList,
              batchSize: batchSize,
              maxPageCount: maxPageCount,
              onTap: () => BlocProvider.of<PresenceBloc>(context).add(PresenceEvent.loadMore(
                lastDocumentId: presenceList.last.id,
                batchSize: batchSize
              )),
              );
          case PresenceLoadingMoreState():
            return LoadMoreButton(
              text: AppLocalizations.of(context).loading,
              presenceList: presenceList,
              batchSize: batchSize,
              maxPageCount: maxPageCount,
            );
          case PresenceErrorState():
            return SizedBox.shrink();
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

}

class LoadMoreButton extends StatefulWidget {

  final String? text;
  final List<Presence> presenceList;
  final int batchSize;
  final int maxPageCount;
  final void Function()? onTap;

  const LoadMoreButton({
    required this.presenceList,
    required this.batchSize,
    required this.maxPageCount,
    this.text,
    this.onTap,
    super.key,
  });

  @override
  State<LoadMoreButton> createState() => _LoadMoreButtonState();
}

class _LoadMoreButtonState extends State<LoadMoreButton> {

  @override
  Widget build(BuildContext context) {
    if (
      widget.presenceList.isEmpty ||
      widget.presenceList.length < widget.batchSize ||
      widget.presenceList.length >= widget.maxPageCount * widget.batchSize
    ) {
      return const SizedBox.shrink();
    } else {
      String text = widget.text ?? AppLocalizations.of(context).loadMore;
      return AppButton.small(
        text: text.toUpperCase(),
        onTap: widget.onTap,
      );
    }
  }

}



