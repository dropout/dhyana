
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:dhyana/widget/util/intersperse.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  static const double widgetHeight = kToolbarHeight - 16.0;

  final String? titleText;
  final Widget? leading;
  final List<Widget> trailing;

  const CustomAppBar({
    this.titleText,
    this.leading,
    this.trailing = const [],
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppThemeData.paddingMd),
        child: NavigationToolbar(
          // leading: (leading != null) ? ConstrainedBox(
          //   constraints: const BoxConstraints.tightFor(width: widgetHeight),
          //   child: leading,
          // ) : null,
          // middle: buildTitle(context, titleText),

          leading: Row(
            children: [
              (leading != null) ? ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: widgetHeight),
                child: leading,
              ) : const SizedBox.shrink(),
              Gap.large(),
              buildTitle(context, titleText),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: trailing.map((w) => ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: widgetHeight),
              child: w,
            )).toList().intersperse(const SizedBox(width: AppThemeData.paddingMd)),
          ),
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context, String? text) {
    if (text == null) {
      return const SizedBox.shrink();
    }

    return Text(text,
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
