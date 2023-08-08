import 'package:flutter/material.dart';
import 'package:dhyana/widgets/app_theme_data.dart';

import 'app_circular_progress_indicator.dart';

class AppLoadingDisplay extends StatelessWidget {

  final String? text;

  const AppLoadingDisplay({
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hasText = (text != null);
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(AppThemeData.spacingMd),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const AppCircularProgressIndicator(),
              if (hasText) const SizedBox(height: AppThemeData.spacingLg),
              if (hasText) Text(text!, textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge)
            ]
          )
        ),
      ),
    );

  }
}
