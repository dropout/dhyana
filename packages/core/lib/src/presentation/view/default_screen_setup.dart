import 'dart:ui' as ui;

import 'package:core/src/presentation/view/parchment_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_ui/material_ui.dart';

import 'package:core/src/presentation/view/util/app_error_display.dart';
import 'package:core/src/presentation/view/util/app_loading_display.dart';
import 'package:core/src/presentation/view/app_bar/custom_app_bar.dart';
import 'package:core/src/presentation/view/app_bar/custom_back_button.dart';
import 'package:core/src/presentation/design_spec.dart';

/// A default screen setup widget that provides common UI elements and behaviors.
/// This widget is designed to be flexible and customizable, allowing you
/// to easily create new screens with a consistent look and feel across the app.
class const DefaultScreenSetup({
  required final String title,
  final List<Widget> slivers = const [],
  final Widget? backButton,
  final Widget? overlay,
  final bool enableAppBarSliver = true,
  final bool enableTitleSliver = true,
  final bool enableScrolling = true,
  final bool enableScaffolding = true,
  final bool enableTitleScrollEffect = true,
  final Color? titleColor,
  final Color? backgroundColor,
  final Color? appBarBackgroundColor,
  final bool enablePullToRefresh = false,
  final Future<void> Function()? onRefresh,
  super.key,
}) extends StatefulWidget {
  @override
  State<DefaultScreenSetup> createState() => _DefaultScreenSetupState();
}

class _DefaultScreenSetupState extends State<DefaultScreenSetup>
    with DefaultScreenSetupHelpersMixin {

  // Used by parchment background to determine scroll offset
  ValueNotifier<double> scrollOffset = ValueNotifier<double>(0.0);

  // Used to display title in appbar if scrolled upwards and normal 
  // title in the sliver is going offscreen.
  double appBarTitleOpacity = 0.0;

  // Background shader, title effect depends on data the controller provides.
  final ScrollController titleEffectScrollController = ScrollController();

  @override
  void initState() {
    titleEffectScrollController.addListener(_calculateAppBarTitleOpacity);
    super.initState();
  }

  void _calculateAppBarTitleOpacity() {
    double min = CustomAppBar.widgetHeight - DesignSpec.spacingMd;
    double max = min * 2;
    double delta = max - min;
    double offset = titleEffectScrollController.offset;

    final double t = ui.clampDouble(1.0 - (offset - min) / delta, 0.0, 1.0);
    double newTitleOpacity = ui.clampDouble(1 - t, 0.0, 1.0);

    if (appBarTitleOpacity.compareTo(newTitleOpacity) != 0) {
      setState(() {
        appBarTitleOpacity = ui.clampDouble(1 - t, 0.0, 1.0);
      });
    }

    // update the scroll offset notifier
    scrollOffset.value = offset;
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
          if (widget.enableAppBarSliver)
            buildTitleEffectAppBar(
              context,
              title: widget.title,
              titleOpacity: appBarTitleOpacity,
              backgroundColor: widget.appBarBackgroundColor,
              titleColor: widget.titleColor,
              backButton: widget.backButton,
              enableTitleSliver: widget.enableTitleSliver,
            ),
          if (widget.enablePullToRefresh)
            CupertinoSliverRefreshControl(
              refreshTriggerPullDistance: 200,
              onRefresh: () => _onRefresh(context),
            ),
          if (widget.enableTitleSliver)
            buildTitleEffectSliverTitle(
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
      final double topInset = MediaQuery.of(context).viewPadding.top;
      final double appBarHeight = 56;
      final double appBarHeightWithTopPadding = topInset + kToolbarHeight;
      
      const double fadeLength = 10.0;

      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appBarHeight),
          child: CustomAppBar(
            titleWidget: buildTitleEffectAppBarTitle(
              context,
              widget.title,
              titleOpacity: appBarTitleOpacity,
              enableTitleSliver: widget.enableTitleSliver,
            ),
            leading: CustomBackButton(),
          ),
        ),
        body: ParchmentBackground(
          scrollOffset: scrollOffset,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              final double fadeStart = appBarHeightWithTopPadding / bounds.height;
              final double fadeEnd =
                  (appBarHeightWithTopPadding + fadeLength) / bounds.height;

              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
                  Colors.transparent, // Top segment
                  Colors.transparent, // Cut-off point (transparent side)
                  Colors.white, // Cut-off point (visible side)
                  Colors.white, // Bottom segment
                ],
                stops: [0.0, fadeStart, fadeEnd, 1.0],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: buildScaffoldBody(
              context: context,
              body: Padding(
                padding: EdgeInsets.only(top: appBarHeightWithTopPadding),
                child: body,
              ),
            ),
          ),
        ),
      );
    } else {
      return body;
    }
  }

  Widget buildScaffoldBody({required BuildContext context, required Widget body}) {
    if (widget.overlay == null) return body;
    return Stack(
      children: [
        body,
        widget.overlay!,
      ],
    );    
  }

  @override
  void dispose() {
    titleEffectScrollController.dispose();
    super.dispose();
  }
}

/// Helper mixin for default screen setup, 
/// providing common widgets and app bar effects.
mixin DefaultScreenSetupHelpersMixin {
  Widget buildLoadingSliver(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: AppLoadingDisplay(),
    );
  }

  Widget buildErrorSliver(BuildContext context) {
    return SliverFillRemaining(hasScrollBody: false, child: AppErrorDisplay());
  }

  Widget buildTitleEffectAppBar(
    BuildContext context, {
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
      // backgroundColor: backgroundColor,
      backgroundColor: Colors.transparent,
      floating: false,
      pinned: true,
      scrolledUnderElevation:
          0.0, // Turn off material design weird transparency effect
      // Custom back button is sizing depends on leading padding
      // and leading width for now
      leading: Padding(
        padding: EdgeInsets.only(left: DesignSpec.paddingLg),
        child: backButton ?? CustomBackButton(backgroundColor: titleColor),
      ),
      leadingWidth: 60.0,
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
      of = Offset(0, DesignSpec.spacingSm * (1.0 - titleOpacity));
      o = titleOpacity;
    }

    return Transform.translate(
      offset: of,
      child: Opacity(
        opacity: o,
        child: Text(
          titleText,
          style: Theme.of(context).textTheme.headlineSmall!
              .copyWith(fontWeight: FontWeight.bold, color: color),
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
      style: Theme.of(context).textTheme.headlineLarge!
          .copyWith(fontWeight: FontWeight.bold, color: color),
    );
  }

  Widget buildTitleEffectSliverTitle(
    BuildContext context,
    String title, {
    Color? color,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(DesignSpec.spacingMd),
        child: buildTitleEffectTitle(context, title, color: color),
      ),
    );
  }
}
