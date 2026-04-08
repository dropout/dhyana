import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/widget/chanting/chant_card.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PlaylistSheet extends StatelessWidget {

  const PlaylistSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChantingCubit, ChantingState>(
      builder: (context, cs) {
        return buildContent(context, cs);
      },
    );
  }

  Widget buildContent(BuildContext context, ChantingState state) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            Gap.large(),
            Text(
              context.l10n.chantingPlaylistSheetTitle,
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
                itemCount: state.chantingSettings.selectedChants.length,
                itemBuilder: (context, index) {
                  final chant =
                    state.chantingSettings.selectedChants[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: DesignSpec.paddingSm),
                    child: ChantCard(
                      index: index,
                      chant: chant,
                      textColor: switch (state.isGapActive) {
                        true when index <= state.currentIndex => Colors.grey.shade600,
                        _ => index < state.currentIndex
                            ? Colors.grey.shade600
                            : Colors.black,
                      },
                      trailing: buildTrailing(context, index, state),
                    ),
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
                text: context.l10n.close.toUpperCase(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget? buildTrailing(BuildContext context, int index, ChantingState chantingState) {
    if (chantingState.isGapActive && index == chantingState.currentIndex + 1) {
      return PlaylistItemBadge(text: context.l10n.chantingPlaylistBadgeNext);
    }

    if (!chantingState.isGapActive && index == chantingState.currentIndex) {
      return PlaylistItemBadge(text: switch (chantingState.playbackState) {
        .playing => context.l10n.chantingPlaylistBadgePlaying,
        .paused => context.l10n.chantingPlaylistBadgePaused,
        .completed => context.l10n.chantingPlaylistBadgeCompleted,
        _ => context.l10n.chantingPlaylistBadgePlaying,
      });
    }

    return null;
  }

}

class PlaylistItemBadge extends StatelessWidget {

  final String text;

  const PlaylistItemBadge({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: DesignSpec.paddingSm,
          vertical: DesignSpec.paddingXs,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text.toUpperCase(),
          style: context.theme.textTheme.labelSmall!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
  }
}