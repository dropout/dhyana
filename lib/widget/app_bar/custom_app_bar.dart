import 'dart:ui';

import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_button.dart';
import 'package:dhyana/widget/timer/settings_history/all.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        child: SizedBox.expand(
          child: NavigationToolbar(
            leading: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: widgetHeight),
              child: leading,
            ),
            middle: buildTitle(context, titleText),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: trailing.map((w) => ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: widgetHeight),
                child: w,
              )).toList(),
            ),

          )
        ),
      ),
    );
  }

  Widget? buildTitle(BuildContext context, String? text) {
    if (text == null) {
      return null;
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
