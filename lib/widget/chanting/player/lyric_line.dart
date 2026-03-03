import 'package:flutter/material.dart';
import 'package:ttml_parser/ttml_parser.dart';

/// Renders a single [TtmlLine] with per-word highlight animation.
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
    required this.agent,
  });

  final TtmlLine line;
  final Duration position;
  final bool isActive;
  final TtmlAgent? agent;

  bool get _isInstrumental => line.words.every((w) => w.text == '0');

  CrossAxisAlignment get _crossAxisAlignment {
    final type = agent?.type;
    return type == 'other'
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: _crossAxisAlignment,
        children: [
          if (_isInstrumental)
            _buildInstrumental()
          else
            Wrap(
              runSpacing: 4,
              children: _buildWords(),
            ),
        ],
      ),
    );
  }

  Widget _buildInstrumental() {
    return Icon(
      Icons.music_note,
      color: isActive
          ? Colors.white54
          : Colors.white.withValues(alpha: 0.35),
      size: 28,
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
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: Colors.white.withValues(alpha: 0.45),
      ),
    );
  }

  Widget _buildWord(TtmlWord word) {
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
    final isSinging = !isSung && position >= word.begin;

    if (isSung) {
      return Text(
        word.text,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      );
    }

    if (isSinging) {
      final wordDurationMicros = word.duration.inMicroseconds;
      final progress = wordDurationMicros <= 0
          ? 1.0
          : ((position - word.begin).inMicroseconds / wordDurationMicros)
              .clamp(0.0, 1.0);

      const style = TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w800,
      );

      return Stack(
        children: [
          // Bottom layer — dim, unfilled background.
          Text(
            word.text,
            style: style.copyWith(
              color: Colors.white.withValues(alpha: 0.45),
            ),
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
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: Colors.white.withValues(alpha: 0.45),
      ),
    );
  }
}