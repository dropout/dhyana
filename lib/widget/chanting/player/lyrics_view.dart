import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/util/duration.dart';
import 'package:dhyana/widget/chanting/player/lyric_line.dart';
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

  /// Creates a [LyricsView] widget.
  const LyricsView({
    required this.chantingState,
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

  /// List of currently visible line indices and 
  /// their offsets from the top of the scroll view.
  List<(int, double)> _visibleLineOffsets = []; // (lineIndex, offsetFromTop)

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

    if (widget.chantingState.activeLineIndex !=
        oldWidget.chantingState.activeLineIndex) {
      debugPrint(
        'Active line index changed: ${oldWidget.chantingState.activeLineIndex} -> ${widget.chantingState.activeLineIndex}',
      );
      // if (widget.chantingState.playbackState != .playing) {
        _scrollToActiveLine();
      // }
      
    }
  }

  /// Handler for when the isScrolling on [ScrollController] changes.
  /// When user scrolls manually, we want to pause playback to avoid fighting
  /// with the auto-scrolling behavior.
  void _onIsScrollingChanged() {
    // Ensure that we only pause when user is actively touching the screen
    // When animating scroll programmatically, do not pause
    if (_scrollController.position.isScrollingNotifier.value && isPointerDown) {
      BlocProvider.of<ChantingCubit>(context, listen: false).pause();
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

    // 
    final targetPosition = _calculateActiveLineBeginPosition();

    if (targetPosition != null) {
      BlocProvider.of<ChantingCubit>(
        context,
        listen: false,
      ).seek(targetPosition);
      debugPrint('Seeking to position: ${targetPosition.formatHHMMSSmm()}');
    }
  }  

  /// Scrolls the view to center the active line. 
  /// Only called when the active line changes.
  void _scrollToActiveLine() async {
    // Don't auto-scroll if user is actively scrolling
    if (isScrolling) return;

    final activeIndex = widget.chantingState.activeLineIndex;

    // Find the offset of the active line from the list of currently visible lines
    // If not found, indicate with a negative index and skip the auto-scrolling
    final target = _visibleLineOffsets.firstWhere(
      (entry) => (entry.$1 == activeIndex),
      orElse: () => (-1, 0.0),
    );

    // If the active line is currently visible, animate to center it
    if (target.$1 >= 0) {
      final targetOffset = widget.topOffset + target.$2 - widget.topOffset;
      debugPrint(
        'Current offset: ${_scrollController.offset}, Target offset: $targetOffset',
      );

      setState(() {
        isAnimating = true;
      });

      final animationFinished = _scrollController.animateTo(
        targetOffset,
        duration: Durations.long1,
        curve: Curves.easeInOut,
      );

      animationFinished.whenComplete(() {
        setState(() {
          isAnimating = false;
        });
      });
    }
  }


  /// Calculates the target scroll position to keep the active line centered.
  /// If the closest line is the same as the current active line, 
  /// returns null to indicate no seeking needed.
  Duration? _calculateActiveLineBeginPosition() {
    double minOffset = double.infinity;
    int closestLineIndex = 0;

    // Find the visible line that is closest to the center of the view
    for (final entry in _visibleLineOffsets) {
      final localOffset = entry.$2 - _scrollController.offset;
      if (localOffset.abs() < minOffset) {
        minOffset = localOffset.abs();
        closestLineIndex = entry.$1;
      }
    }
    // debugPrint('Closest Line Index: $closestLineIndex with offset: $minOffset');

    // If the closest line is different from the current active line, 
    // return the begin time of that line to seek to. 
    // Otherwise, return null to indicate no seeking.
    if (widget.chantingState.activeLineIndex != closestLineIndex) {
      final targetLine =
        widget.chantingState.lyricsDocument?.lines[closestLineIndex];
      if (targetLine != null) {
        return targetLine.begin;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final lyricsDocument = widget.chantingState.lyricsDocument;
    if (lyricsDocument == null) {
      return Center(child: Text('No lyrics available'));
    }

    return NotificationListener<LyricLinesNotification>(
      onNotification: (notification) {
        setState(() {
          _visibleLineOffsets = notification.visibleOffsets.entries
            .map((e) => (e.key, e.value))
            .toList();
        });
        return true; // Indicate we've handled the notification
      },
      child: Listener(
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
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(top: widget.topOffset),
            ), // Extra space at the top
            LyricLinesSliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final line = lyricsDocument.lines[index];
                return LyricLine(
                  line: line,
                  position: widget.chantingState.position,
                  isActive: index == widget.chantingState.activeLineIndex,
                  agent: widget.chantingState.lyricsDocument?.agentFor(
                    line.agentId,
                  ),
                );
              }, childCount: lyricsDocument.lines.length),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 300),
            ), // Extra space at the bottom
          ],
        ),
      ),
    );
  }
}
