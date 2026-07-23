import 'package:dhyana/modules/practice/chanting/domain/model/lyrics_word.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/util/app_context.dart';
import 'package:flutter/material.dart';

enum WordState {
  active,
  pending,
  sung,
}

class LyricWordWidget extends StatelessWidget {
  final LyricsWord word;
  final WordState wordState;

  const LyricWordWidget({
    required this.word,
    required this.wordState,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late final Color color;

    switch (wordState) {
      case WordState.active:
        color = AppColors.redAccent;
        break;
      case WordState.sung:
        color = Colors.grey.shade600;
        break;
      case WordState.pending:
        color = Colors.white;
        break;
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
