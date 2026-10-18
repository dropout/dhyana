import 'dart:async';

import 'package:chanting/src/domain/entity/chanting_state_entity.dart';
import 'package:chanting/src/presentation/viewmodel/chanting_cubit.dart';
import 'package:chanting/src/presentation/view/player/lyric_focus.dart';
import 'package:chanting/src/presentation/view/player/lyric_line.dart';
import 'package:chanting/src/presentation/view/player/lyric_text_style.dart';
import 'package:chanting/src/presentation/view/player/lyrics_effects_config.dart';
import 'package:chanting/src/presentation/view/player/unculled_varied_extent_list.dart';
import 'package:chanting/src/presentation/view/player/worm_line.dart';
import 'package:core/core.dart';

import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Displays the lyrics for the currently playing chant, with auto-scrolling
/// to keep the active line centered.
/// Users can also manually scroll through the lyrics, that will also
/// seek the chant audio to the corresponding line. 
///During user-initiated scrolls,
/// playback will be paused to avoid fighting with the auto-scrolling behavior.
class const LyricsView({
  /// The current state of the chanting player, containing
  /// the lyrics document and active line index.
  required final ChantingStateEntity chantingState,
  
  /// The maximum width available for the lyrics view.
  required final double maxWidth,

  /// The vertical offset from the top of the screen where
  /// the active line should be centered.
  final double topOffset = 200.0,

  /// Visual effects configuration; use [LyricsEffectsConfig.disabled]
  /// to turn all effects off.  
  final LyricsEffectsConfig effects = const LyricsEffectsConfig(),
  super.key,
}) extends StatefulWidget {
  @override
  State<LyricsView> createState() => _LyricsViewState();
}

/// Scroll interaction modes.
enum _Mode {
  /// Auto-following the active line.
  synced,

  /// The user is dragging or flinging the list.
  userScrolling,

  /// The user let go; waiting for the idle timer before following again.
  resuming,
}

class _LyricsViewState extends State<LyricsView>
    with SingleTickerProviderStateMixin {

  /// The delay before resuming auto-scrolling after 
  /// the user stops interacting.
  static const Duration _resumeDelay = Duration(milliseconds: 1000);

  /// The minimum duration between consecutive seek operations 
  /// to avoid excessive updates.
  static const Duration _seekThrottle = Duration(milliseconds: 100);

  /// Scroll controller to manage programmatic scrolling and
  /// listen to user scroll events.
  final ScrollController _scrollController = ScrollController();

  /// Drives the staggered visual catch-up after each programmatic jump.
  late final AnimationController _wormAnimationController;

  /// The text style used for rendering the lyrics lines.
  late TextStyle _lyricsTextStyle;

  Timer? _resumeTimer;
  _Mode _mode = .synced;

  /// Whether the user is currently touching the screen.
  bool _isPointerDown = false;

  /// Pixels still to be absorbed visually by the lines, and the line
  /// around which the stagger is centered.
  double _wormDelta = 0;
  int _wormAnchor = 0;

  DateTime _lastSeek = DateTime.fromMillisecondsSinceEpoch(0);

  List<double> _lyricLineHeights = [];

  @override
  void initState() {
    super.initState();

    // Initialize the worm animation controller for staggered visual catch-up.
    _wormAnimationController = AnimationController(
      vsync: this,
      duration: widget.effects.wormDuration,
      value: 1,
    );

    // Add a post-frame callback to set up scroll listeners after the first frame.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.addListener(_onScroll);
      if (_scrollController.hasClients) {
        // Reliable way to detect user-initiated scrolls vs programmatic scrolls
        _scrollController.position.isScrollingNotifier.addListener(
          _onIsScrollingChanged,
        );
      }
    });

    

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Theme or text changes can alter the base style, so re-measure.
    _updateLayout();
  }

  /// Resolves the width-based style and re-measures the lines with it,
  /// so the extents always match what is rendered.
  void _updateLayout() {
    _lyricsTextStyle = LyricTextStyle.resolve(
      LyricLine.getLyricsTextStyle(context),
      widget.maxWidth,
    );
    _lyricLineHeights = _calculateLyricLineHeights();
  }

  @override
  void dispose() {
    _resumeTimer?.cancel();
    _wormAnimationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  /// Scrolls to the active line when the active line index changes.
  @override
  void didUpdateWidget(covariant LyricsView oldWidget) {
    super.didUpdateWidget(oldWidget);

    _wormAnimationController.duration = widget.effects.wormDuration;
    if (!widget.effects.isWormScrollOn) _stopWorm();

    // Scroll to lines while the chant is playing.
    if (widget.chantingState.activeLineIndex !=
        oldWidget.chantingState.activeLineIndex) {
      debugPrint(
        'Active line index changed: ${oldWidget.chantingState.activeLineIndex} -> ${widget.chantingState.activeLineIndex}',
      );

      // Only auto-scroll when the chant is playing.
      // If not playing, user can scroll freely without fighting with auto-scroll.
      if (widget.chantingState.playbackState.playing) {
        _scrollToLine(widget.chantingState.activeLineIndex);
      }
    }

    // Re-measure when the lyrics or the available width change.
    if (widget.chantingState.lyricsDocument !=
            oldWidget.chantingState.lyricsDocument ||
        widget.maxWidth != oldWidget.maxWidth ||
        (_lyricLineHeights.isEmpty &&
            widget.chantingState.lyricsDocument?.lines.isNotEmpty == true)) {
      setState(_updateLayout);
      if (widget.maxWidth != oldWidget.maxWidth) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted && _scrollController.hasClients) {
            _scrollToLine(widget.chantingState.activeLineIndex);
          }
        });
      }
    }
  }

  List<double> _calculateLyricLineHeights() {
    final lh = <double>[];
    for (final line in widget.chantingState.lyricsDocument?.lines ?? []) {
      final height = calculateTextHeight(
        LyricLine.displayText(line),
        _lyricsTextStyle,
        widget.maxWidth,
        LyricLine.linePadding,
      );
      lh.add(height);
    }
    return lh;
  }

  /// Pauses playback when the user starts scrolling by hand, and schedules
  /// the return to auto-follow when the scroll ends.
  void _onIsScrollingChanged() {
    final scrolling = _scrollController.position.isScrollingNotifier.value;
    // Programmatic jumps never reach here with the pointer down.
    if (scrolling && _isPointerDown) {
      _resumeTimer?.cancel();
      _stopWorm();
      context.read<ChantingCubit>().pause();
      setState(() => _mode = _Mode.userScrolling);
    } else if (!scrolling && _mode == _Mode.userScrolling) {
      setState(() => _mode = _Mode.resuming);
      _resumeTimer?.cancel();
      _resumeTimer = Timer(_resumeDelay, _onResumeTimer);
    }
  }

  void _onResumeTimer() {
    if (!mounted || _mode != _Mode.resuming) return;
    _mode = _Mode.synced;
    if (widget.chantingState.playbackState.playing) {
      _scrollToLine(widget.chantingState.activeLineIndex);
    }
  }

  /// Seeks to the line closest to the anchor during user-initiated scrolls.
  void _onScroll() {
    if (_mode != _Mode.userScrolling) return;

    final now = DateTime.now();
    if (now.difference(_lastSeek) < _seekThrottle) return;
    _lastSeek = now;

    context.read<ChantingCubit>().seekToLine(
      _calculateActiveLineIndexFromScroll(),
    );
  }

  /// Settles all lines at their final position immediately.
  void _stopWorm() {
    _wormAnimationController.value = 1;
  }

  /// Jumps the scroll view to the line and lets the lines catch up visually
  /// with a stagger, so the list moves like a worm.
  void _scrollToLine(int lineIndex) {
    if (_mode == _Mode.userScrolling) return;
    if (!_scrollController.hasClients ||
        lineIndex < 0 ||
        lineIndex >= _lyricLineHeights.length) {
      return;
    }

    _resumeTimer?.cancel();
    _mode = _Mode.synced;

    // Summing heights before the line gives the offset where it begins; the
    // top padding makes offset 0 align the first line at [topOffset].
    double target = 0;
    for (int i = 0; i < lineIndex; i++) {
      target += _lyricLineHeights[i];
    }
    final position = _scrollController.position;
    target = target.clamp(position.minScrollExtent, position.maxScrollExtent);

    var delta = target - position.pixels;
    if (delta.abs() < 1) return;

    // Carry over what the previous animation had not yet absorbed.
    final effects = widget.effects;
    if (_wormAnimationController.isAnimating) {
      delta +=
          _wormDelta *
          (1 -
              wormProgress(
                index: lineIndex,
                anchor: _wormAnchor,
                t: _wormAnimationController.value,
                delayPerLine: effects.wormDelayPerLine,
                maxDelay: effects.wormMaxDelay,
              ));
    }

    if (!effects.isWormScrollOn) {
      _scrollController.animateTo(
        target,
        duration: Durations.long2 * 2,
        curve: Curves.easeInOut,
      );
      return;
    }

    _scrollController.jumpTo(target);

    if (MediaQuery.disableAnimationsOf(context)) {
      _stopWorm();
      return;
    }

    _wormDelta = delta;
    _wormAnchor = lineIndex;
    _wormAnimationController.forward(from: 0);
  }

  int _calculateActiveLineIndexFromScroll() {
    final lineHeights = _lyricLineHeights;
    if (lineHeights.isEmpty) return 0;

    double minDiff = double.infinity;
    int closestLineIndex = 0;
    double cumulativeOffset = 0;

    // Find the line whose cumulative offset is closest to the current scroll position
    for (int i = 0; i < lineHeights.length; i++) {
      final diff = (cumulativeOffset - _scrollController.offset).abs();
      if (diff < minDiff) {
        minDiff = diff;
        closestLineIndex = i;
      }
      cumulativeOffset += lineHeights[i];
    }

    return closestLineIndex;
  }

  /// Build the list of slivers separately from the CustomScrollView so that
  /// in the initialization phase the isScrollNotifier listener can be
  /// attached to the ScrollController that is attached to a CustomScrollView.
  /// So even if it's empty the CustomScrollView should always be built with a
  /// ScrollController attached.
  @override
  Widget build(BuildContext context) {
    final slivers = <Widget>[];
    if (widget.chantingState.lyricsLoadingState == .completed &&
        _lyricLineHeights.isNotEmpty) {
      final lyricsDocument = widget.chantingState.lyricsDocument!;
      slivers.addAll([
        SliverPadding(
          padding: EdgeInsets.only(top: widget.topOffset),
        ), // Extra space at the top
        UnculledSliverVariedExtentList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final line = lyricsDocument.lines[index];
            final lyricLine = LyricFocus(
              index: index,
              activeIndex: widget.chantingState.activeLineIndex,
              isUserScrolling: _mode == _Mode.userScrolling,
              config: widget.effects,
              child: LyricLine(
                line: line,
                position: widget.chantingState.latencyCompensatedPosition,
                chantingState: widget.chantingState,
                isActive: index <= widget.chantingState.activeLineIndex,
              ),
            );
            if (!widget.effects.isWormScrollOn) return lyricLine;
            return WormLine(
              index: index,
              animation: _wormAnimationController,
              delta: () => _wormDelta,
              anchor: () => _wormAnchor,
              delayPerLine: widget.effects.wormDelayPerLine,
              maxDelay: widget.effects.wormMaxDelay,
              child: lyricLine,
            );
          }, childCount: widget.chantingState.lyricsDocument!.lines.length),
          itemExtentBuilder: (index, sliverLayoutDimensions) {
            return _lyricLineHeights[index];
          },
        ),
        SliverPadding(
          padding: EdgeInsets.only(bottom: 300),
        ), // Extra space at the bottom
      ]);
    }

    return Listener(
      onPointerDown: (_) {
        _isPointerDown = true;
        _resumeTimer?.cancel();
        _stopWorm();
      },
      onPointerUp: (_) => _isPointerDown = false,
      onPointerCancel: (_) => _isPointerDown = false,
      child: LyricTextStyle(
        style: _lyricsTextStyle,
        child: CustomScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          slivers: slivers,
        ),
      ),
    );
  }

}
