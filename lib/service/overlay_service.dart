import 'package:flutter/material.dart';

abstract class OverlayService {

  Future<T?> showModalBottomSheet<T>(
    BuildContext context,
    Widget Function(BuildContext) builder,
  );

}
