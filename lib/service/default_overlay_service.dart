import 'package:flutter/material.dart' as m;

import 'overlay_service.dart';

class DefaultOverlayService extends OverlayService {

  @override
  Future<T?> showModalBottomSheet<T>(
    m.BuildContext context,
    m.Widget Function(m.BuildContext) builder
  ) {
    return m.showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: m.Colors.transparent,
      shape: const m.RoundedRectangleBorder(borderRadius: m.BorderRadius.zero),
      useRootNavigator: true,
      builder: builder,
    );
  }

}
