import 'package:chanting/src/domain/entity/lyrics_line_entity.dart';
import 'package:chanting/src/domain/entity/lyrics_word_entity.dart';
import 'package:chanting/src/presentation/view/player/lyric_text_style.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';

/// Highlight phase of a word relative to the playback position.
enum LyricWordPhase { pending, highlight, active, sung }

/// Renders a word whose color animates (vsynced) whenever its
/// [LyricWordPhase] changes.
class const LyricWordWidget({
  required final LyricsWordEntity word,
  required final Duration position,
  required final LyricsLineEntity line,
  super.key,
}) extends StatefulWidget {
  static const Duration fadeDuration = Durations.medium1;
  static const Duration sungFadeDuration = Durations.long1;

  static LyricWordPhase phaseAtPosition({
    required LyricsLineEntity line,
    required LyricsWordEntity word,
    required Duration position,
  }) {
    if (position < line.start) return .pending;
    if (position >= line.end) return .sung;
    if (position >= word.start && position < word.end) return .highlight;
    return .active;
  }

  static Color colorOf(LyricWordPhase phase) => switch (phase) {
    LyricWordPhase.pending => Color.fromARGB(255, 96, 96, 96),
    LyricWordPhase.highlight => AppColors.gold,
    LyricWordPhase.active => AppColors.appWhite,
    LyricWordPhase.sung => Color.fromARGB(255, 96, 96, 96),
  };

  @override
  State<LyricWordWidget> createState() => _LyricWordWidgetState();
}

class _LyricWordWidgetState extends State<LyricWordWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late LyricWordPhase _phase;
  late Color _from;
  late Color _to;

  @override
  void initState() {
    super.initState();
    _phase = _currentPhase();
    _from = _to = LyricWordWidget.colorOf(_phase);
    _controller = AnimationController(vsync: this);
  }

  @override
  void didUpdateWidget(covariant LyricWordWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    final next = _currentPhase();
    if (next == _phase) return;
    _phase = next;

    // Restart from the color currently on screen so interrupted fades stay smooth.
    _from = _currentColor;
    _to = LyricWordWidget.colorOf(next);
    _controller
      ..stop()
      ..duration = next == LyricWordPhase.sung
          ? LyricWordWidget.sungFadeDuration
          : LyricWordWidget.fadeDuration
      ..forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  LyricWordPhase _currentPhase() => LyricWordWidget.phaseAtPosition(
    line: widget.line,
    word: widget.word,
    position: widget.position,
  );

  Color get _currentColor => Color.lerp(_from, _to, _controller.value)!;

  @override
  Widget build(BuildContext context) {
    final style = LyricTextStyle.of(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) =>
          Text(widget.word.text, style: style.copyWith(color: _currentColor)),
    );
  }
}
