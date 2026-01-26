import 'package:flutter/material.dart';

abstract interface class OverlayService {

  Future<T?> showModalBottomSheet<T>(
    BuildContext context,
    Widget Function(BuildContext) builder,
  );

}
