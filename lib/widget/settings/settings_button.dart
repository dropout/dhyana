import 'package:dhyana/widget/util/home_screen_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/route/app_screen.dart';

class SettingsIcon extends StatelessWidget {
  const SettingsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(AppScreen.settings.name);
      },
      child: const HomeScreenMenuButton(
        child: SizedBox(
          width: 36,
          height: 36,
          child: Icon(
            Icons.settings,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }


}
