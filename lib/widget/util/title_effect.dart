import 'dart:ui' as ui;

import 'package:dhyana/widget/app_bar/custom_app_bar.dart';
import 'package:dhyana/widget/app_theme_data.dart';

import 'package:flutter/material.dart';

mixin TitleEffectMixin {

  double titleEffectRatio = 0.0;

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

}
