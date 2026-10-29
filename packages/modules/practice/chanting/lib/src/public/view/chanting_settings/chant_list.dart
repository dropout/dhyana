import 'package:material_ui/material_ui.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:core/core.dart';
import 'package:chanting/src/public/view/chanting_settings/chant_card.dart';
import 'package:chanting/l10n/chanting_localizations.dart';
import 'package:chanting/src/public/model/chant_playlist_item.dart';


class const ChantList({
  required final List<ChantPlaylistItem> chants,
  required final void Function(int oldIndex, int newIndex) onReorder,
  required final VoidCallback onAddChant,
  required final void Function(ChantPlaylistItem, int) onChantRemoved,
  final double fadeExtent = 24.0,
  super.key,
}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    if (chants.isEmpty) return buildEmpty(context);
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) {
        final fade = fadeExtent / bounds.height;
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
          stops: [0, fade, 1 - fade, 1],
        ).createShader(bounds);
      },
      child: buildList(context).reveal(2),
    );
  }

  Widget buildList(BuildContext context) {
    return ReorderableListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: DesignSpec.paddingLg),
      buildDefaultDragHandles: false,
      itemCount: chants.length,
      onReorderItem: (oldIndex, newIndex) => onReorder(oldIndex, newIndex),
      itemBuilder: (context, index) =>
        buildPlaylistItem(context, chants[index], index),
      proxyDecorator: (child, index, animation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? animatedChild) {
            return Material(color: Colors.transparent, child: animatedChild);
          },
          child: child,
        );
      },
    );
  }

  Widget buildEmpty(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      mainAxisAlignment: MainAxisAlignment.center,        
      children: [
        Text(
          ChantingLocalizations.of(context).chantingPlaylistEmptyTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!
              .copyWith(fontWeight: FontWeight.w800),
        ).reveal(2),
        Gap.small(),
        Text(
          ChantingLocalizations.of(
            context,
          ).chantingPlaylistEmptyDescription,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!
              .copyWith(fontWeight: FontWeight.w800),
        ).reveal(3),
      ],
    );
  }

  Widget buildPlaylistItem(
    BuildContext context,
    ChantPlaylistItem chant,
    int index,
  ) {
    final enableDragging = chants.length > 1;
    final isLast = index == chants.length - 1;
    final paddingBottom = index < chants.length - 1
        ? DesignSpec.paddingSm
        : 0.0;

    return Slidable(
      closeOnScroll: true,
      key: ValueKey(chant.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.25,
        children: [
          CustomSlidableAction(
            onPressed: (_) {
              onChantRemoved(chant, index);
              context.services.hapticsService.success();
            },
            backgroundColor: Colors.transparent,
            // foregroundColor: Colors.white,
            padding: EdgeInsets.only(
              left: DesignSpec.paddingSm,
              // right: DesignSpec.paddingSm,
              bottom: isLast ? 0.0 : DesignSpec.paddingSm,
            ),
            child: const DynamicSlideActionIcon(),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: paddingBottom),
        child: ChantCard(
          key: ValueKey(chant.id),
          index: index,
          chantViewModel: chant,
          imageDimension: 80,
          trailing: SizedBox.square(
            dimension: 48,
            child: ReorderableDragStartListener(
              enabled: enableDragging,
              index: index,
              child: enableDragging
                  ? const Icon(Icons.drag_handle)
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}

class DynamicSlideActionIcon extends StatefulWidget {
  const DynamicSlideActionIcon({super.key});

  @override
  State<DynamicSlideActionIcon> createState() => _DynamicSlideActionIconState();
}

class _DynamicSlideActionIconState extends State<DynamicSlideActionIcon> {
  static const _visibleThreshold = 0.25;

  Animation<double>? _slideAnimation;
  bool _actionWasVisible = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final nextAnimation = Slidable.of(context)?.animation;
    if (identical(nextAnimation, _slideAnimation)) return;

    _slideAnimation?.removeListener(_handleSlideChanged);
    _slideAnimation = nextAnimation;
    _actionWasVisible = (nextAnimation?.value ?? 0) >= _visibleThreshold;
    _slideAnimation?.addListener(_handleSlideChanged);
  }

  void _handleSlideChanged() {
    final isVisible = (_slideAnimation?.value ?? 0) >= _visibleThreshold;

    if (isVisible && !_actionWasVisible) {
      context.hapticsTap();
    }

    _actionWasVisible = isVisible;
  }

  @override
  void dispose() {
    _slideAnimation?.removeListener(_handleSlideChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = _slideAnimation;
    if (animation == null) return const SizedBox.shrink();

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final value = animation.value
            .remapAndClamp(0.0, _visibleThreshold, 0.0, 1.0)
            .toDouble();

        return Opacity(
          opacity: value,
          child: Transform.scale(
            scale: value,
            // child: /* your existing icon container */,

            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(
                    DesignSpec.borderRadiusLg,
                  ),
                ),
                color: context.theme.colorScheme.error,
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        );
      },
    );
  }
}
