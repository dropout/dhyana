import 'dart:async';
import 'dart:math';

import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/widget/chanting/player/lyric_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LyricsView extends StatefulWidget {
  final ChantingState chantingState;
  final double topOffset;

  const LyricsView({
    required this.chantingState,
    this.topOffset = 200.0,
    super.key,
  });

  @override
  State<LyricsView> createState() => _LyricsViewState();
}

class _LyricsViewState extends State<LyricsView> {
  final ScrollController _scrollController = ScrollController();

  // late final StreamSubscription<Duration> _progressSub;

  List<(int, double)> _visibleOffsets = [];
  bool isScrolling = false;
  bool isPointerDown = false;
  bool isAnimating = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.addListener(_onScroll);
      if (_scrollController.hasClients) {
        _scrollController.position.isScrollingNotifier.addListener(
          _onIsScrollingChanged,
        );
      }
    });
  }

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

  @override
  void dispose() {
    // _progressSub.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant LyricsView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.chantingState.activeLineIndex !=
        oldWidget.chantingState.activeLineIndex) {
      _scrollToActiveLine();
    }
  }

  void _scrollToActiveLine() async {
    // Don't auto-scroll if user is actively scrolling
    if (isScrolling) return;

    final activeIndex = widget.chantingState.activeLineIndex;

    final target = _visibleOffsets.firstWhere(
      (entry) => entry.$1 == activeIndex,
      orElse: () => (-1, 0.0),
    );

    if (target.$1 >= 0) {
      final targetOffset = widget.topOffset + target.$2 - widget.topOffset;
      print(
        'Current offset: ${_scrollController.offset}, Target offset: $targetOffset',
      );

      setState(() {
        isAnimating = true;
      });

      await _scrollController.animateTo(
        targetOffset,
        duration: Durations.long1,
        curve: Curves.easeInOut,
      );

      setState(() {
        isAnimating = false;
      });
    }

  }

  void _onScroll() {
    print('Scroll offset: ${_scrollController.offset}');
    _calculateActiveLineScroll();
  }

  void _calculateActiveLineScroll() {
    double minOffset = double.infinity;
    int closestLineIndex = 0;
    for (final entry in _visibleOffsets) {
      final localOffset = entry.$2 - _scrollController.offset;

      if (localOffset < 0) continue; // Skip lines that are above the current scroll position

      if (localOffset.abs() < minOffset) {
        minOffset = localOffset.abs();
        closestLineIndex = entry.$1;
      }
    }

    // print('Closest Line Index: $closestLineIndex with offset: $minOffset');
    if (widget.chantingState.activeLineIndex != closestLineIndex) {
      // closestLineIndex = max(
      //   0, 
      //   widget.chantingState.lyricsDocument?.lines.length ?? 0 - 1
      // );
      final targetLine =
        widget.chantingState.lyricsDocument?.lines[closestLineIndex];
      if (targetLine != null) {
        // print(
        //   'Seeking to line index: $closestLineIndex at position: ${targetLine.begin.inSeconds} seconds',
        // );
        BlocProvider.of<ChantingCubit>(
          context,
          listen: false,
        ).seek(targetLine.begin);
      }
    }
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
          _visibleOffsets = notification.visibleOffsets.entries
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
