import 'package:dhyana/widgets/util/separator_gem.dart';
import 'package:flutter/material.dart';

class CompletedViewSeparatorGem extends StatelessWidget {

  final EdgeInsets padding;

  const CompletedViewSeparatorGem({
    required this.padding,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SeparatorGem(
      count: 1,
      gemSize: 12,
      padding: padding,
      color: Colors.white,
    );
  }

}
