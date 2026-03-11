
import 'package:collection/collection.dart';
import 'package:dhyana/model/lyrics_line.dart';
import 'package:dhyana/model/lyrics_word.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Renders a single [LyricsLine] with per-word highlight animation.
///
/// Words are rendered in one of four visual states:
/// - **Inactive** — the line is not currently active.
/// - **Pending** — the line is active but the word hasn't started yet.
/// - **Singing** — the word is actively being sung; a left-to-right fill
///   animation progresses from dim to white.
/// - **Sung** — the word has already been sung; rendered fully white.
class LyricLine extends StatelessWidget {
  const LyricLine({
    super.key,
    required this.line,
    required this.position,
    required this.isActive,
  });

  final LyricsLine line;
  final Duration position;
  final bool isActive;

  bool get _isInstrumental => line.words.every((w) => w.text == '0');

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: double.infinity,
    //   color: Colors.pink,
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    //     child: Wrap(
    //       spacing: 8.0, // Gap between adjacent chips
    //       runSpacing: 4.0, // Gap between lines
    //       children: <Widget>[
    //         Chip(label: Text('Item 1')),
    //         Chip(label: Text('Item 2')),
    //         Chip(label: Text('Item 3')),
    //         Chip(label: Text('Item 4')),
    //       ],
    //     ),
    //   ),
    // );

    return AnimatedScale(
      duration: Durations.short4,
      scale: isActive ? 1.0 : 0.95,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_isInstrumental)
              _buildInstrumental()
            else
              Wrap(runSpacing: 4, children: _buildWords()),
          ],
        ),
      ),
    );
  }

  Widget _buildInstrumental() {
    return Icon(
      Icons.music_note,
      color: isActive ? Colors.white54 : Colors.white.withValues(alpha: 0.35),
      size: 26,
    );
  }

  List<Widget> _buildWords() {
    final widgets = <Widget>[];
    for (var i = 0; i < line.words.length; i++) {
      final word = line.words[i];
      widgets.add(_buildWord(word));
      // Add a space after every word except the last.
      if (i < line.words.length - 1) {
        widgets.add(_buildSpace());
      }
    }
    return widgets;
  }

  Widget _buildSpace() {
    if (!isActive) {
      return Text(
        ' ',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: Colors.white.withValues(alpha: 0.35),
        ),
      );
    }
    return Text(
      ' ',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        color: Colors.white.withValues(alpha: 0.45),
      ),
    );
  }

  Widget _buildWord(LyricsWord word) {
    if (!isActive) {
      return Text(
        word.text,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: Colors.white.withValues(alpha: 0.35),
        ),
      );
    }

    final isSung = position >= word.end;
    final isSinging = !isSung && position >= word.start;

    if (isSung) {
      return Text(
        word.text,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      );
    }

    if (isSinging) {
      final wordDurationMicros = word.duration.inMicroseconds;
      final progress = wordDurationMicros <= 0
          ? 1.0
          : ((position - word.start).inMicroseconds / wordDurationMicros).clamp(
              0.0,
              1.0,
            );

      const style = TextStyle(fontSize: 26, fontWeight: FontWeight.w800);

      return Stack(
        children: [
          // Bottom layer — dim, unfilled background.
          Text(
            word.text,
            style: style.copyWith(color: Colors.white.withValues(alpha: 0.45)),
          ),
          // Top layer — full white, clipped to the current progress width.
          ClipRect(
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Text(
                word.text,
                style: style.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    }

    // Pending — active line but word hasn't started.
    return Text(
      word.text,
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        color: Colors.white.withValues(alpha: 0.45),
      ),
    );
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
  final SliverMultiBoxAdaptorElement childManager = context as SliverMultiBoxAdaptorElement;
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
