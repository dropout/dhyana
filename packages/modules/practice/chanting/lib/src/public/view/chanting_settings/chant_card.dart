import 'package:core/core.dart';
import 'package:chanting/src/public/model/chant_playlist_item.dart';
import 'package:material_ui/material_ui.dart';

class ChantCard extends StatelessWidget {
  final int index;
  final ChantPlaylistItem chantViewModel;
  final Color textColor;
  final Widget? trailing;
  final ImageProvider? chantImageProvider;

  const ChantCard({
    required this.index,
    required this.chantViewModel,
    this.trailing,
    this.chantImageProvider,
    this.textColor = Colors.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundPaperLight,
        borderRadius: BorderRadius.circular(DesignSpec.borderRadiusMd),
        boxShadow: DesignSpec.defaultBoxShadow,
      ),
      child: Row(
        children: [
          SizedBox.square(
            dimension: 64,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(DesignSpec.borderRadiusMd),
                bottomLeft: Radius.circular(DesignSpec.borderRadiusMd),
              ),
              child: AppCachedNetworkImage(
                imagePath: '/chants/${chantViewModel.chantId}/cover.jpg',
                blurHash: chantViewModel.blurHash,
                resourceResolver: context.services.resourceResolver,
                imageProvider: chantImageProvider,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.only(
                left: DesignSpec.paddingLg,
                right: trailing == null ? DesignSpec.paddingLg : 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: .min,
                children: [
                  Text(
                    chantViewModel.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                      color: textColor,
                    ),
                  ),
                  Text(
                    chantViewModel.duration.formatMMss(),
                    style: context.theme.textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}