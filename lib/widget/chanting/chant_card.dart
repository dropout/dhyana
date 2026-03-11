import 'package:dhyana/model/chant.dart';
import 'package:dhyana/util/duration.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

class ChantCard extends StatelessWidget {
  final int index;
  final Chant chant;
  final bool isCurrent;
  final Widget? trailing;

  const ChantCard({
    required this.index,
    required this.chant,
    this.trailing,
    this.isCurrent = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(DesignSpec.paddingSm),
      child: Row(
        children: [
          SizedBox.square(
            dimension: 32,
            child: Center(
              child: Text(
              '${index + 1}.',
              textAlign: TextAlign.center,
              style: context.theme.textTheme.bodyLarge,
              ),
            ),
          ),
          Gap.small(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  chant.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(chant.length.formatMMss()),
              ],
            ),
          ),
          Gap.small(),
          ?trailing,
        ],
      ),
    );
  }

  Widget buildTrailing(BuildContext context) {
    if (isCurrent) {
      return Icon(
        Icons.music_note_rounded,
        color: context.theme.colorScheme.primary,
      );
    } else {
      return IconButton(
        icon: Icon(Icons.play_circle_outline_rounded),
        onPressed: () {},
      );
    }
  }
}
