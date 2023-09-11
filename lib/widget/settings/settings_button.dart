import 'package:dhyana/widget/util/home_screen_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/route/app_screen.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreenMenuButton(
      onTap: () => GoRouter.of(context).pushNamed(AppScreen.settings.name),
      child: const SizedBox(
        width: 36,
        height: 36,
        child: Icon(
          Icons.settings,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

}
