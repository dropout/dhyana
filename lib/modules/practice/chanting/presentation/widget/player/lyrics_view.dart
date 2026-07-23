import 'package:dhyana/modules/practice/chanting/presentation/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/util/text.dart';
import 'package:dhyana/modules/practice/chanting/presentation/widget/player/lyric_line.dart';
import 'package:dhyana/core/presentation/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Displays the lyrics for the currently playing chant, with auto-scrolling
/// to keep the active line centered.
/// Users can also manually scroll through the lyrics, that will also
/// seek the chant to the corresponding line. During user-initiated scrolls,
/// playback will be paused to avoid fighting with the auto-scrolling behavior.
class LyricsView extends StatefulWidget {
  /// The current state of the chanting player, containing
  /// the lyrics document and active line index.
  final ChantingState chantingState;

  /// The vertical offset from the top of the screen where
  /// the active line should be centered.
  final double topOffset;

  final double maxWidth;

  /// Creates a [LyricsView] widget.
  const LyricsView({
    required this.chantingState,
    required this.maxWidth,
    this.topOffset = 200.0,
    super.key,
  });

  @override
  State<LyricsView> createState() => _LyricsViewState();
}

class _LyricsViewState extends State<LyricsView> {
  /// Scroll controller to manage programmatic scrolling and
  /// listen to user scroll events.
  final ScrollController _scrollController = ScrollController();

  /// Flag to indicate whether there is scrolling of
  /// any kind (user-initiated or programmatic) currently happening.
  bool isScrolling = false;

  /// Flag to indicate whether the user is currently touching the screen.
  bool isPointerDown = false;

  /// Flag to indicate whether we are currently
  /// animating the scroll position programmatically.
  bool isAnimating = false;

  List<double> _lyricLineHeights = [];

  @override
  void initState() {
    super.initState();

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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Scrolls to the active line when the active line index changes.
  @override
  void didUpdateWidget(covariant LyricsView oldWidget) {
    super.didUpdateWidget(oldWidget);

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

    // Update line height when change there is a change in the lyrics document 
    if (widget.chantingState.lyricsDocument !=
        oldWidget.chantingState.lyricsDocument) {             
      setState(() {
        _lyricLineHeights = _calculateLyricLineHeights();
      });
    } else if (_lyricLineHeights.isEmpty &&
        widget.chantingState.lyricsDocument?.lines.isNotEmpty == true) {
      // If the lyric line heights are empty but the lyrics document is loaded,
      // calculate the line heights.
      setState(() {
        _lyricLineHeights = _calculateLyricLineHeights();
      });
    }
  }

  List<double> _calculateLyricLineHeights() {
    final lh = <double>[];
    for (final line in widget.chantingState.lyricsDocument?.lines ?? []) {
      final height = calculateTextHeight(
        line.text,
        context.theme.textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.w700,
        ),
        widget.maxWidth,
        LyricLine.linePadding,
      );
      lh.add(height);
    }
    return lh;
  }

  /// Handler for when the isScrolling on [ScrollController] changes.
  /// When user scrolls manually, we want to pause playback to avoid fighting
  /// with the auto-scrolling behavior.
  void _onIsScrollingChanged() {
    // Ensure that we only pause when user is actively touching the screen
    // When animating scroll programmatically, do not pause
    if (_scrollController.position.isScrollingNotifier.value && isPointerDown) {
      context.read<ChantingCubit>().pause();
      setState(() {
        isScrolling = true;
      });
    } else {
      setState(() {
        isScrolling = false;
      });
    }
  }

  /// Handler for scroll events.
  /// The goal of handling scroll events is to seek the chant to the line
  /// that is closest to the center of the view when user scrolls manually.
  /// During programmatic scrolls (e.g. when active line changes during playback),
  /// we do not want to trigger seeking.
  void _onScroll() {
    // If not user-initiated scroll, do not trigger seeking
    if (!isScrolling) {
      return;
    }

    final targetActiveLineIndex = _calculateActiveLineIndexFromScroll();
    context.read<ChantingCubit>().seekToLine(targetActiveLineIndex);
  }

  /// Scrolls the view to center the active line.
  /// Only called when the active line changes.
  void _scrollToLine(int lineIndex) async {
    // Don't auto-scroll if user is actively scrolling
    if (isScrolling) return;

    // final lineHeights = widget.chantingState.lyricsLineHeights;
    if (_lyricLineHeights.isEmpty || lineIndex >= _lyricLineHeights.length) {
      return;
    }

    // Calculate the cumulative scroll offset for the target line.
    // The top SliverPadding of [topOffset] pixels shifts line content
    // visually, but scroll offset 0 aligns to the first line (after padding).
    // Summing heights up to lineIndex gives the offset where that line begins.
    double targetScrollOffset = 0;
    for (int i = 0; i < lineIndex; i++) {
      targetScrollOffset += _lyricLineHeights[i];
    }

    debugPrint(
      'Scrolling to line $lineIndex — '
      'current offset: ${_scrollController.offset}, '
      'target offset: $targetScrollOffset',
    );

    setState(() {
      isAnimating = true;
    });

    final animationFinished = _scrollController.animateTo(
      targetScrollOffset,
      duration: Durations.long2 * 2,
      curve: Curves.easeInOut,
    );

    animationFinished.whenComplete(() {
      if (mounted) {
        setState(() {
          isAnimating = false;
        });
      }
    });
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
    if (widget.chantingState.lyricsLoadingState == .loaded && _lyricLineHeights.isNotEmpty) {
      final lyricsDocument = widget.chantingState.lyricsDocument!;
      slivers.addAll([
        SliverPadding(
          padding: EdgeInsets.only(top: widget.topOffset),
        ), // Extra space at the top
        SliverVariedExtentList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final line = lyricsDocument.lines[index];
            return LyricLine(
              line: line,
              position: widget.chantingState.position,
              chantingState: widget.chantingState,
              isActive: index <= widget.chantingState.activeLineIndex,
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
        setState(() {
          isPointerDown = true;
        });
      },
      onPointerUp: (_) {
        setState(() {
          isPointerDown = false;
        });
      },
      child: CustomScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        slivers: slivers,
      ),
    );
  }
}
