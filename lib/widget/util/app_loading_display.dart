import 'package:flutter/material.dart';
import 'package:dhyana/widget/design_spec.dart';

import 'app_circular_progress_indicator.dart';

class AppLoadingDisplay extends StatelessWidget {
  
  final String? text;
  final Color? color;

  const AppLoadingDisplay({
    this.text, 
    this.color, 
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final bool hasText = (text != null);
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(DesignSpec.spacingMd),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppCircularProgressIndicator(color: color ?? Theme.of(context).primaryColor),
            if (hasText) const SizedBox(height: DesignSpec.spacingLg),
            if (hasText)
              Text(
                text!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
          ],
        ),
      ),
    );
  }
}
