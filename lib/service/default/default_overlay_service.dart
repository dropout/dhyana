import 'package:flutter/material.dart' as m;

import '../overlay_service.dart';

class DefaultOverlayService implements OverlayService {

  @override
  Future<T?> showModalBottomSheet<T>(
    m.BuildContext context,
    m.Widget Function(m.BuildContext) builder, {
      bool enableDrag = true,      
    }
  ) {
    return m.showModalBottomSheet<T>(
      context: context,
      enableDrag: enableDrag,
      isScrollControlled: true,
      backgroundColor: m.Colors.transparent,
      shape: const m.RoundedRectangleBorder(borderRadius: m.BorderRadius.zero),
      useRootNavigator: true,
      builder: builder,
    );
  }

}
