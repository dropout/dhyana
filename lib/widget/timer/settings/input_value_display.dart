import 'package:flutter/material.dart';
import 'package:dhyana/widget/app_theme_data.dart';

class InputValueDisplay extends StatelessWidget {

  final String value;
  const InputValueDisplay({
    required this.value,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppThemeData.spacingMd,
        vertical: AppThemeData.spacingSm
      ),
      decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: Colors.black
      ),
      child: Text(
        value,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

}
