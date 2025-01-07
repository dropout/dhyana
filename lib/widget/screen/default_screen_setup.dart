import 'dart:ui' as ui;

import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/widget/app_bar/custom_app_bar.dart';
import 'package:dhyana/widget/app_bar/custom_back_button.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';

class DefaultScreenSetup extends StatefulWidget {

  final String title;
  final List<Widget> slivers;
  final Widget? backButton;
  final bool includeAppBarSliver;
  final bool includeTitleSliver;
  final bool enableScrolling;
  final Color? titleColor;
  final Color? backgroundColor;
  final Color? appBarBackgroundColor;

  const DefaultScreenSetup({
    required this.title,
    this.slivers = const [],
    this.backButton,
    this.includeAppBarSliver = true,
    this.includeTitleSliver = true,
    this.enableScrolling = true,
    this.titleColor,
    this.backgroundColor,
    this.appBarBackgroundColor,
    super.key,
  });

  @override
  State<DefaultScreenSetup> createState() => _DefaultScreenSetupState();
}

class _DefaultScreenSetupState extends State<DefaultScreenSetup>
  with DefaultScreenSetupHelpersMixin {

  double appBarTitleOpacity = 0.0;
  final ScrollController titleEffectScrollController = ScrollController();

  @override
  void initState() {
    titleEffectScrollController.addListener(_calculateAppBarTitleOpacity);
    super.initState();
  }

  void _calculateAppBarTitleOpacity() {
    double min = CustomAppBar.widgetHeight - AppThemeData.spacingMd;
    double max = min * 2;
    double delta = max - min;
    double offset = titleEffectScrollController.offset;

    final double t = ui.clampDouble(1.0 - (offset - min) / delta, 0.0, 1.0);
    double newTitleOpacity = ui.clampDouble(1-t, 0.0, 1.0);

    if (appBarTitleOpacity.compareTo(newTitleOpacity) != 0) {
      setState(() {
        appBarTitleOpacity = ui.clampDouble(1-t, 0.0, 1.0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? Theme.of(context).colorScheme.surface,
      body: CustomScrollView(
        controller: titleEffectScrollController,
        physics: widget.enableScrolling
          ? null
          : const NeverScrollableScrollPhysics(),
        slivers: [
          if (widget.includeAppBarSliver) buildTitleEffectAppBar(
            context,
            title: widget.title,
            titleOpacity: appBarTitleOpacity,
            backgroundColor: widget.appBarBackgroundColor,
            titleColor: widget.titleColor,
            backButton: widget.backButton,
          ),
          if (widget.includeTitleSliver) buildTitleEffectSliverTitle(
            context,
            widget.title,
            color: widget.titleColor,
          ),
          ...widget.slivers,
        ],
      ),
    );
  }

  @override
  void dispose() {
    titleEffectScrollController.dispose();
    super.dispose();
  }

}

mixin DefaultScreenSetupHelpersMixin {

  Widget buildLoadingSliver(BuildContext context) {
    return SliverFillRemaining(
      child: AppLoadingDisplay(),
    );
  }

  Widget buildErrorSliver(BuildContext context) {
    return SliverFillRemaining(
      child: AppErrorDisplay(),
    );
  }

  Widget buildTitleEffectAppBar(BuildContext context,{
    String? title,
    double? titleOpacity,
    Color? backgroundColor,
    Color? titleColor,
    Widget? backButton,
  }) {
    Widget? titleWidget;
    if (title != null) {
      titleWidget = buildTitleEffectAppBarTitle(
        context,
        title,
        titleOpacity: titleOpacity,
        color: titleColor,
      );
    }

    return SliverAppBar(
      centerTitle: false,
      elevation: 0,
      // stretch: true, // Not working?
      floating: false,
      pinned: true,
      scrolledUnderElevation: 0.0, // Turn off material design weird transparency effect
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      leading: Padding(
        padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0,),
        child: backButton ?? CustomBackButton()
      ),
      leadingWidth: 64,
      title: titleWidget,
    );
  }

  Widget? buildTitleEffectAppBarTitle(
    BuildContext context,
    String titleText, {
      double? titleOpacity,
      Color? color,
  }) {
    return Transform.translate(
      offset: Offset(0, AppThemeData.spacingSm * (1.0 - (titleOpacity ?? 1.0))),
      child: Opacity(
        opacity: titleOpacity ?? 1.0,
        child: Text(
          titleText,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }

  Widget buildTitleEffectTitle(
    BuildContext context,
    String title, {
    Color? color,
  }) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  Widget buildTitleEffectSliverTitle(
    BuildContext context,
    String title, {
    Color? color,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(AppThemeData.spacingMd),
        child: buildTitleEffectTitle(context, title, color: color),
      )
    );
  }

}
