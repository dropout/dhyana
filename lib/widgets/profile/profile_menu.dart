import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/route/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileMenu extends StatelessWidget {

  const ProfileMenu({super.key});

  void _onSignOutPressed(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(const SignOut());
    context.goNamed(AppScreen.home.name);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Aktivitás'),
          enabled: true,
          onTap: () => context.pushNamed(AppScreen.editProfile.name),
        ),
        const Divider(height: 0),
        ListTile(
          title: Text('Profile szerkesztése'),
          enabled: true,
          onTap: () => context.pushNamed(AppScreen.editProfile.name),
        ),
        const Divider(height: 0),
        ListTile(
          title: Text('Kijelentkezés'),
          enabled: true,
          onTap: () => _onSignOutPressed(context),
        ),
        const Divider(height: 0),
      ],
    );
  }
}