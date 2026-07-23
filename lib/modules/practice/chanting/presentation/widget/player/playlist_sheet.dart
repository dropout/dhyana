import 'package:dhyana/modules/practice/chanting/presentation/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/modules/practice/chanting/presentation/widget/chant_card.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/util/app_button.dart';
import 'package:dhyana/core/presentation/util/app_context.dart';
import 'package:dhyana/core/presentation/util/gap.dart';
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
                  final chantViewModel = state.chantingSettings.selectedChants[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: DesignSpec.paddingSm,
                    ),
                    child: ChantCard(
                      index: index,
                      chantViewModel: chantViewModel,
                      textColor: index < state.currentIndex
                          ? Colors.grey.shade600
                          : Colors.black,
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

  Widget? buildTrailing(
    BuildContext context,
    int index,
    ChantingState chantingState,
  ) {
    if (index == chantingState.currentIndex) {
      return switch (chantingState.playbackState.playing) {
        true => PlaylistItemBadge(text: context.l10n.chantingPlaylistBadgePlaying),
        false => PlaylistItemBadge(text: context.l10n.chantingPlaylistBadgePaused),
      };
    }
    return null;
  }
}

class PlaylistItemBadge extends StatelessWidget {
  final String text;

  const PlaylistItemBadge({required this.text, super.key});

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
