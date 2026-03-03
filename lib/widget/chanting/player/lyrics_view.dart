import 'package:dhyana/widget/chanting/player/lyric_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ttml_parser/ttml_parser.dart';

/// A scrollable list of all lyric lines in [document].
///
/// Automatically scrolls so the active line (identified by [activeLineIndex])
/// is centred on screen whenever the active line changes.
class LyricsView extends StatefulWidget {
  
  const LyricsView({
    super.key,
    required this.document,
    required this.position,
    required this.activeLineIndex,
  });

  final TtmlDocument document;
  final Duration position;

  /// The index of the currently active line in [document.lines], or `-1` if
  /// no line is active.
  final int activeLineIndex;


  @override
  State<LyricsView> createState() => _LyricsViewState();
}

class _LyricsViewState extends State<LyricsView> {
  late final ScrollController _scrollController;
  late final List<GlobalKey> _keys;
  int _lastActiveIndex = -1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _keys = List.generate(
      widget.document.lines.length,
      (_) => GlobalKey(),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(LyricsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newIndex = widget.activeLineIndex;
    if (newIndex != _lastActiveIndex) {
      _lastActiveIndex = newIndex;
      if (newIndex >= 0 && newIndex < _keys.length) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          final context = _keys[newIndex].currentContext;
          if (context != null) {
            Scrollable.ensureVisible(
              context,
              alignment: 0.5,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final lines = widget.document.lines;
    return ListView.builder(
      controller: _scrollController,
      itemCount: lines.length + 2, // +2 for top and bottom padding sentinels
      itemBuilder: (context, index) {
        if (index == 0) {
          return const SizedBox(height: 40);
        }
        if (index == lines.length + 1) {
          return const SizedBox(height: 40);
        }
        final lineIndex = index - 1;
        final line = lines[lineIndex];
        return LyricLine(
          key: _keys[lineIndex],
          line: line,
          position: widget.position,
          isActive: lineIndex == widget.activeLineIndex,
          agent: widget.document.agentFor(line.agentId),
        );
      },
    );
  }
}