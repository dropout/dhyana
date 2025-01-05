import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:dhyana/widget/app_bar/custom_app_bar.dart';
import 'package:dhyana/widget/app_bar/custom_back_button.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';

mixin TitleEffectMixin<T extends StatefulWidget> on State<T> {

  double titleEffectRatio = 0.0;
  final ScrollController titleEffectScrollController = ScrollController();

  @override
  void initState() {
    titleEffectScrollController.addListener(
        createListener(titleEffectScrollController, setState)
    );
    super.initState();
  }

  void Function() createListener(ScrollController scrollController, void Function(VoidCallback) setState) {
    return () {
      double min = CustomAppBar.widgetHeight - AppThemeData.spacingMd;
      double max = min * 2;
      double delta = max - min;
      double offset = scrollController.offset;

      final double t = ui.clampDouble(1.0 - (offset - min) / delta, 0.0, 1.0);
      double newTitleOpacity = ui.clampDouble(1-t, 0.0, 1.0);

      if (titleEffectRatio.compareTo(newTitleOpacity) != 0) {
        setState(() {
          titleEffectRatio = ui.clampDouble(1-t, 0.0, 1.0);
        });
      }
    };
  }

  Widget buildTitleEffectAppBar(BuildContext context, String titleText) {
    return SliverAppBar(
      centerTitle: false,
      elevation: 0,
      // stretch: true, // Not working?
      floating: false,
      pinned: true,
      scrolledUnderElevation: 0.0, // Material design wierd transparency effect
      backgroundColor: AppColors.backgroundPaper,
      leading: const Padding(
          padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0,),
          child: CustomBackButton()
      ),
      leadingWidth: 64,
      title: buildTitleEffectAppBarTitle(context, titleText),
    );
  }

  Widget? buildTitleEffectAppBarTitle(BuildContext context, String titleText) {
    return Transform.translate(
      offset: Offset(0, AppThemeData.spacingSm * (1.0 - titleEffectRatio)),
      child: Opacity(
        opacity: titleEffectRatio,
        child: Text(
          titleText,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildTitleEffectTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildTitleEffectSliverTitle(BuildContext context, String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(AppThemeData.spacingMd),
        child: buildTitleEffectTitle(context, title),
      )
    );
  }

  Widget buildTitleEffectScrollView(BuildContext context, String title, {
    List<Widget> slivers = const [],
  }) {
    return CustomScrollView(
      controller: titleEffectScrollController,
      slivers: [
        buildTitleEffectAppBar(context, title),
        buildTitleEffectSliverTitle(context, title),
        ...slivers
      ],
    );
  }

  @override
  void dispose() {
    titleEffectScrollController.dispose();
    super.dispose();
  }

}
