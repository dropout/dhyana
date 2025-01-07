import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:dhyana/widget/util/intersperse.dart';
import 'package:flutter/material.dart';

/*
  CustomAppBar is a custom AppBar that allows for a custom leading widget,
  title text, and trailing widgets.
  Intended height of the AppBar is 56 (kToolbarHeight).
  Padding for the widgets is 8 top and bottom.
  Padding for the AppBar is 16 left and right.
  Leading and trailing widget height is constrained to a height of 40.
 */
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
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppThemeData.paddingLg),
        child: NavigationToolbar(
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
            )).toList().intersperse(Gap.small()),
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
