import 'package:dhyana/model/lyrics_word.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';

enum LyricWordState { inactive, pending, singing, sung }

class LyricWord extends StatelessWidget {
  final LyricsWord word;
  final Duration position;

  const LyricWord({required this.word, required this.position, super.key});

  @override
  Widget build(BuildContext context) {
    late final Color color;
    if (position < word.start) {
      color = Colors.white;
    } else if (position >= word.end) {
      color = Colors.grey.shade600;
    } else {
      color = AppColors.redAccent;
    }

    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 200),
      style: context.theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w700,
        color: color,
      ),
      child: Text(word.text),
    );
  }
}
