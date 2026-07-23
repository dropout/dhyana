import 'package:dhyana/modules/practice/chanting/domain/model/chant.dart';
import 'package:dhyana/util/duration.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/util/app_cached_network_image.dart';
import 'package:dhyana/core/presentation/util/app_context.dart';
import 'package:dhyana/core/presentation/util/gap.dart';
import 'package:flutter/material.dart';

class ChantCard extends StatelessWidget {
  final int index;
  final ChantViewModel chantViewModel;
  final Color textColor;
  final Widget? trailing;

  const ChantCard({
    required this.index,
    required this.chantViewModel,
    this.trailing,
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
                imagePath: '/chants/${chantViewModel.chant.id}/cover.jpg',
                blurHash: chantViewModel.chant.blurHash,
                resourceResolver: context.services.resourceResolver,
              ),
            ),
          ),
          Gap.medium(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  chantViewModel.chant.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: textColor,
                  ),
                ),
                Text(
                  chantViewModel.chant.length.formatMMss(),
                  style: context.theme.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
          Gap.small(),
          ?trailing,
        ],
      ),
    );
  }
}