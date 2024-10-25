import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/route/app_screen.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void showSignoutDialog(BuildContext context) {
  AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
  ProfileBloc profileBloc = BlocProvider.of<ProfileBloc>(context);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).profileSignoutTitle),
          content: Text(AppLocalizations.of(context).profileSignoutQuestion),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  textStyle: Theme.of(context).textTheme.labelLarge
              ),
              child: Text(AppLocalizations.of(context).profileSignoutCancel),
              onPressed: () {
                context.pop();
                context.hapticsTap();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  textStyle: Theme.of(context).textTheme.labelLarge
              ),
              child: Text(AppLocalizations.of(context).profileSignoutYes),
              onPressed: () {
                // close are you sure dialog
                context.pop();

                // do the signout
                authBloc.add(const SignOut());
                profileBloc.add(const ProfileEvent.reset());
                context.goNamed(AppScreen.home.name);
                context.hapticsTap();
                context.logEvent(name: 'profile_signout_pressed');
              },
            ),
          ],
        );
      }
  );
}
