import 'dart:ui' as ui;

import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dhyana/widget/app_bar/custom_app_bar.dart';
import 'package:dhyana/widget/app_bar/custom_back_button.dart';
import 'package:dhyana/widget/app_theme_data.dart';

class DefaultScreenSetup extends StatefulWidget {

  final String title;
  final List<Widget> slivers;
  final Widget? backButton;
  final bool enableAppBarSliver;
  final bool enableTitleSliver;
  final bool enableScrolling;
  final bool enableScaffolding;
  final Color? titleColor;
  final Color? backgroundColor;
  final Color? appBarBackgroundColor;

  final bool enablePullToRefresh;
  final Future<void> Function()? onRefresh;

  const DefaultScreenSetup({
    required this.title,
    this.slivers = const [],
    this.backButton,
    this.enableScaffolding = true,
    this.enableAppBarSliver = true,
    this.enableTitleSliver = true,
    this.enableScrolling = true,
    this.enablePullToRefresh = false,
    this.titleColor,
    this.backgroundColor,
    this.appBarBackgroundColor,
    this.onRefresh,
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

  Future<void> _onRefresh(BuildContext context) async {
    if (widget.onRefresh != null) {
      await widget.onRefresh!.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffolding(
      context,
      CustomScrollView(
        controller: titleEffectScrollController,
        physics: widget.enableScrolling
            ? null
            : const NeverScrollableScrollPhysics(),
        slivers: [
          if (widget.enableAppBarSliver) buildTitleEffectAppBar(
            context,
            title: widget.title,
            titleOpacity: appBarTitleOpacity,
            backgroundColor: widget.appBarBackgroundColor,
            titleColor: widget.titleColor,
            backButton: widget.backButton,
            enableTitleSliver: widget.enableTitleSliver,
          ),
          if (widget.enablePullToRefresh) CupertinoSliverRefreshControl(
            refreshTriggerPullDistance: 200,
            onRefresh: () => _onRefresh(context),
          ),
          if (widget.enableTitleSliver) buildTitleEffectSliverTitle(
            context,
            widget.title,
            color: widget.titleColor,
          ),
          ...widget.slivers,
        ],
      ),
    );
  }

  Widget buildScaffolding(BuildContext context, Widget body) {
    if (widget.enableScaffolding) {
      return Scaffold(
        backgroundColor: widget.backgroundColor,
        body: body,
      );
    } else {
      return body;
    }
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
      hasScrollBody: false,
      child: AppLoadingDisplay(),
    );
  }

  Widget buildErrorSliver(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: AppErrorDisplay(),
    );
  }

  Widget buildTitleEffectAppBar(BuildContext context,{
    String? title,
    double? titleOpacity,
    Color? backgroundColor,
    Color? titleColor,
    Widget? backButton,
    bool enableTitleSliver = true,
  }) {
    Widget? titleWidget;
    if (title != null) {
      titleWidget = buildTitleEffectAppBarTitle(
        context,
        title,
        titleOpacity: titleOpacity,
        color: titleColor,
        enableTitleSliver: enableTitleSliver,
      );
    }

    return SliverAppBar(
      centerTitle: false,
      elevation: 0,
      // stretch: true, // Not working?
      backgroundColor: backgroundColor,
      floating: false,
      pinned: true,
      scrolledUnderElevation: 0.0, // Turn off material design weird transparency effect
      leading: Padding(
        padding: EdgeInsets.only(
          left: AppThemeData.paddingLg,
          top: AppThemeData.paddingSm,
          bottom: AppThemeData.paddingSm
        ),
        child: backButton ?? CustomBackButton(
          backgroundColor: titleColor,
        )
      ),
      leadingWidth: 56.0,
      title: titleWidget,
    );
  }

  Widget? buildTitleEffectAppBarTitle(
    BuildContext context,
    String titleText, {
      double? titleOpacity,
      Color? color,
      bool enableTitleSliver = true,
  }) {

    Offset of;
    double o;
    if (titleOpacity == null || enableTitleSliver == false) {
      of = Offset(0, 0);
      o = 1.0;
    } else {
      of = Offset(0, AppThemeData.spacingSm * (1.0 - titleOpacity));
      o = titleOpacity;
    }


    return Transform.translate(
      offset: of,
      child: Opacity(
        opacity: o,
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
