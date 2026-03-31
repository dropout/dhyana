import 'package:collection/collection.dart';
import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/model/lyrics_line.dart';
import 'package:dhyana/model/lyrics_word.dart';
import 'package:dhyana/widget/chanting/player/lyric_word.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Renders a single [LyricsLine] with per-word highlight animation.
/// The [position] is used to determine the state of each word (inactive, pending, singing, sung).
/// The [isActive] is currently not used, but can be used in the future to apply additional styling to the active line.
class LyricLine extends StatelessWidget {
  final LyricsLine line;
  final Duration position;
  final bool isActive;

  final ChantingState chantingState;

  const LyricLine({
    super.key,
    required this.line,
    required this.position,
    required this.isActive,
    required this.chantingState,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Wrap(runSpacing: -6, children: _buildWords(context)),
    );
  }

  List<Widget> _buildWords(BuildContext context) {
    final widgets = <Widget>[];
    for (var i = 0; i < line.words.length; i++) {
      final word = line.words[i];
      widgets.add(_buildWord(context, word));
      // Add a space after every word except the last.
      if (i < line.words.length - 1) {
        widgets.add(_buildSpace());
      }
    }
    return widgets;
  }

  Widget _buildSpace() {
    return Text(
      ' ',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        color: Colors.white54,
      ),
    );
  }

  Widget _buildWord(BuildContext context, LyricsWord word) {
    if (chantingState.isGapActive) {
      return Text(
        word.text,
        style: context.theme.textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.w700,
          color: Colors.grey.shade600,
        ),
      );
    }

    switch (chantingState.playbackState) {
      case .completed:
        return Text(
          word.text,
          style: context.theme.textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade600,
          ),
        );
      case .loading:
        return Text(
          word.text,
          style: context.theme.textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white54,
          ),
        );
      default:
        return LyricWordWidget(word: word, position: position);
    }

  }
}

class LyricLinesNotification extends Notification {
  final Map<int, double> visibleOffsets;
  LyricLinesNotification(this.visibleOffsets);
}

class LyricLinesSliverList extends SliverMultiBoxAdaptorWidget {
  const LyricLinesSliverList({super.key, required super.delegate});

  @override
  RenderLyricLinesSliverList createRenderObject(BuildContext context) {
    final SliverMultiBoxAdaptorElement childManager =
        context as SliverMultiBoxAdaptorElement;
    return RenderLyricLinesSliverList(
      context: context,
      childManager: childManager,
    );
  }
}

class RenderLyricLinesSliverList extends RenderSliverList {
  final BuildContext? context;

  RenderLyricLinesSliverList({required super.childManager, this.context});

  // Keep track of the last reported state
  Map<int, double>? _lastOffsets;

  @override
  void performLayout() {
    super.performLayout();

    final Map<int, double> currentOffsets = {};
    RenderBox? child = firstChild;

    while (child != null) {
      final SliverMultiBoxAdaptorParentData childParentData =
          child.parentData! as SliverMultiBoxAdaptorParentData;

      // layoutOffset is the distance from the top of the SliverList
      final double itemOffset = childParentData.layoutOffset ?? 0.0;

      currentOffsets[childParentData.index!] = itemOffset;

      child = childAfter(child);
    }

    // Only dispatch if the scroll positions have changed
    // Note: Using MapEquality here since values (offsets) change frequently
    if (!const MapEquality().equals(_lastOffsets, currentOffsets)) {
      _lastOffsets = Map.from(currentOffsets);

      Future.microtask(() {
        if (context != null && (context as Element).mounted) {
          LyricLinesNotification(currentOffsets).dispatch(context);
        }
      });
    }
  }
}
