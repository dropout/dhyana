import 'package:dhyana/widget/design_spec.dart';
import 'package:flutter/material.dart';

import 'gap.dart';

class AppCard extends StatelessWidget {

  final String title;
  final EdgeInsets titlePadding;
  final bool titleGap;
  final EdgeInsets padding;
  final Widget? child;

  const AppCard({
    this.title = '',
    this.child,
    this.titleGap = true,
    this.titlePadding = const EdgeInsets.only(
      top: DesignSpec.paddingLg,
      left: DesignSpec.paddingLg,
      right: DesignSpec.paddingLg,
    ),
    this.padding = const EdgeInsets.only(
      left: DesignSpec.paddingLg,
      right: DesignSpec.paddingLg,
      bottom: DesignSpec.paddingLg,
    ),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundPaperLight,
        borderRadius: BorderRadius.circular(DesignSpec.borderRadiusMd),
        boxShadow: DesignSpec.defaultBoxShadow,
        border: Border.all(
          color: Color.lerp(AppColors.backgroundPaperLight, Colors.white, 0.33)!,
          width: 1.0,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title.isNotEmpty) buildTitle(context, title),
            if (titleGap && title.isNotEmpty) Gap.medium(),
            if (child != null) Padding(
              padding: padding,
              child: child!,
            ),
          ],
        ),
      )
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Padding(
      padding: titlePadding,
      child: Text(title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        softWrap: false,
      ),
    );
  }

}
