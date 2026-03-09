import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/model/chant.dart';
import 'package:dhyana/util/duration.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_button.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlaylistSheet extends StatelessWidget {
  final ChantingState chantingState;

  const PlaylistSheet({required this.chantingState, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            Gap.large(),
            Text(
              'Playlist',
              style: context.theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap.medium(),
            Expanded(
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.only(
                  // top: 120,
                  bottom: MediaQuery.of(context).viewPadding.bottom,
                  left: DesignSpec.paddingLg,
                  right: DesignSpec.paddingLg,
                ),
                itemCount: chantingState.chantingSettings.selectedChants.length,
                itemBuilder: (context, index) {
                  final chant =
                    chantingState.chantingSettings.selectedChants[index];
                  return PlaylistItem(
                    index: index,
                    chant: chant,
                    isCurrent: index == chantingState.currentIndex,
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: DesignSpec.padding2Xl),
              child: AppButton(
                onTap: () => context.pop(),
                text: 'Close'.toUpperCase(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PlaylistItem extends StatelessWidget {
  
  final int index;
  final Chant chant;
  final bool isCurrent;

  const PlaylistItem({
    required this.index, 
    required this.chant, 
    this.isCurrent = false, 
    super.key
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
                style: context.theme.textTheme.bodyLarge
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
                  style: context.theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(chant.length.formatMMss()),
              ],
            ),
          ),
          Spacer(),
          buildTrailing(context),
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
        onPressed: () {
        },
      );
    }
  }

}
