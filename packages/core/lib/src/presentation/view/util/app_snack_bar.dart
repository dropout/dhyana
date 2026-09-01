import 'package:flutter/material.dart';

SnackBar getSuccessSnackBar(BuildContext context, String text) {
  return SnackBar(
    backgroundColor: Colors.green,
    content: Text(text,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: Colors.white,
      )
    )
  );
}

SnackBar getErrorSnackBar(BuildContext context, String text) {
  return SnackBar(
    backgroundColor: Theme.of(context).colorScheme.error,
    content: Text(text,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: Colors.white,
      )
    )
  );
}
