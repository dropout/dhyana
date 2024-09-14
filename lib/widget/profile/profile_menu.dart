import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/route/all.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileMenu extends StatelessWidget {

  final Profile profile;

  const ProfileMenu({
    required this.profile,
    super.key
  });

  void _onActivityTapped(BuildContext context) {
    context.pushNamed(AppScreen.activity.name);
    context.hapticsTap();
  }

  void _onEditProfileTapped(BuildContext context) {
    context.pushNamed(AppScreen.editProfile.name);
    context.hapticsTap();
  }

  void _onStatisticsTapped(BuildContext context) {
    context.pushNamed(
      AppScreen.profileStats.name,
      pathParameters: {
        'profileId': profile.id
      }
    );
    context.hapticsTap();
  }

  void _onSignoutTapped(BuildContext context) {
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
                  GoRouter.of(context).pop();
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
                  GoRouter.of(context).pop();
                  authBloc.add(const SignOut());
                  profileBloc.add((const ResetProfileContent()));
                  GoRouter.of(context).goNamed(AppScreen.login.name);
                  context.hapticsTap();
                  context.logEvent(name: 'profile_signout_pressed');
                },
              ),
            ],
          );
        }
    );
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {

    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            AppLocalizations.of(context).activity,
            style: textStyle,
          ),
          enabled: true,
          onTap: () => _onActivityTapped(context),
        ),
        const Divider(height: 0),
        ListTile(
          title: Text(
            AppLocalizations.of(context).editProfile,
            style: textStyle,
          ),
          enabled: true,
          onTap: () => _onEditProfileTapped(context),
        ),
        const Divider(height: 0),
        ListTile(
          title: Text(
            AppLocalizations.of(context).profileStats,
            style: textStyle,
          ),
          enabled: true,
          onTap: () => _onStatisticsTapped(context),
        ),
        const Divider(height: 0),
        ListTile(
          title: Text(
            AppLocalizations.of(context).signOut,
            style: textStyle,
          ),
          enabled: true,
          onTap: () => _onSignoutTapped(context),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
