import 'package:core/core.dart';
import 'package:chanting/src/public/model/chant_playlist_item.dart';
import 'package:material_ui/material_ui.dart';

class const ChantCard({
  required final int index,
  required final ChantPlaylistItem chantViewModel,
  final double imageDimension = 64.0,
  final Color textColor = Colors.black,
  final Widget? trailing,
  final ImageProvider? chantImageProvider,
  super.key,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.backgroundPaperLight,
            borderRadius: BorderRadius.circular(DesignSpec.borderRadiusMd),
            boxShadow: DesignSpec.defaultBoxShadow,
          ),
          child: Row(
            children: [
              SizedBox.square(
                // dynamically sized based on available space
                dimension: imageDimension,
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
                  padding: EdgeInsets.only(
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
    );
  }
}
