import 'package:dhyana/widget/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {

  static const double height = AppThemeData.spacing3xl + 8.0;

  final String? title;

  const CustomAppBar({
    this.title,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: AppThemeData.spacing3xl,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).appBarTheme.backgroundColor!,
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
            BoxShadow(
              color: Theme.of(context).appBarTheme.backgroundColor!,
              offset: const Offset(-5,0),
            ),
            BoxShadow(
              color: Theme.of(context).appBarTheme.backgroundColor!,
              offset: const Offset(5,0),
            )
          ]
          // color: Colors.red,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: AppThemeData.spacingMd),
            buildBackButton(context),
            const SizedBox(width: AppThemeData.spacingMd),
            buildTitle(context),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    if (title != null) {
      return Text(
        title!,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pop(),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_back,
            size: 24,
            color: Colors.white
          )
        ),
      )
    );
  }

}
