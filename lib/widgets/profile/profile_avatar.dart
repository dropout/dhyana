import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/route/app_screen.dart';

class ProfileAvatar extends StatelessWidget {

  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(AppScreen.login.name);
      },
      child: const SizedBox(
        width: 36,
        height: 36,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          child: Icon(
            Icons.account_circle_rounded,
            size: 32,
          ),
        ),
      ),
    );
  }

}
