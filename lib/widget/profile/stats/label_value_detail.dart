import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';

class LabelValueDetail extends StatelessWidget {

  final String label;
  final String value;

  const LabelValueDetail({
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        Spacer(),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
