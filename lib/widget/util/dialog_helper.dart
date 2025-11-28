import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void showSignoutDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return _getSignoutDialog(context);
    },
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.4),
    barrierLabel: '',
    transitionDuration: Durations.medium4,
    transitionBuilder: (context, anim1, anim2, child) {
      final curvedAnimation = CurvedAnimation(
        parent: anim1,
        curve: Curves.easeInOutBack,
      );
      return ScaleTransition(
        scale: curvedAnimation,
        child: Opacity(
          opacity: curvedAnimation.value.clamp(0.0, 1.0),
          child: child,
        ),
      );
    },
  );
}

void showDeleteProfileDialog(BuildContext context, Profile profile) {
  showGeneralDialog(
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return _getDeleteProfileDialog(context, profile);
    },
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.4),
    barrierLabel: '',
    transitionDuration: Durations.medium4,
    transitionBuilder: (context, anim1, anim2, child) {
      final curvedAnimation = CurvedAnimation(
        parent: anim1,
        curve: Curves.easeInOutBack,
      );
      return ScaleTransition(
        scale: curvedAnimation,
        child: Opacity(
          opacity: curvedAnimation.value.clamp(0.0, 1.0),
          child: child,
        ),
      );
    },
  );
}

Widget _getSignoutDialog(BuildContext context) {
  AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
  final profileCubit = BlocProvider.of<ProfileCubit>(context);
  return AlertDialog(
    title: Text(AppLocalizations.of(context).profileSignoutTitle),
    content: Text(AppLocalizations.of(context).profileSignoutQuestion),
    backgroundColor: AppColors.backgroundPaperLight,
    actions: [
      TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
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
          textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(AppLocalizations.of(context).profileSignoutYes,),
        onPressed: () {
          // close are you sure dialog
          context.pop();

          // do the signout
          authBloc.add(const SignOut());

          context.hapticsTap();
          context.logEvent(name: 'profile_signout_pressed');

          Future.delayed(Durations.medium1, () {
            if (context.mounted) {
              context.showSuccessfulToast(
                  AppLocalizations.of(context).signOutSuccessfulMessage
              );
            }
          });

          const HomeRoute().go(context);
          profileCubit.clearData();
        },
      ),
    ],
  );
}

Widget _getDeleteProfileDialog(BuildContext context, Profile profile) {
  return AlertDialog(
    title: Text(AppLocalizations.of(context).profileDeleteTitle),
    content: Text(AppLocalizations.of(context).profileDeleteQuestion),
    backgroundColor: AppColors.backgroundPaperLight,
    actions: [
      TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(AppLocalizations.of(context).profileDeleteCancel),
        onPressed: () {
          context.pop();
          context.hapticsTap();
        },
      ),
      TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        child: Text(AppLocalizations.of(context).profileDeleteYes,),
        onPressed: () {
          context.pop(); // close are you sure dialog
          context.hapticsTap();
          context.logEvent(name: 'profile_delete_pressed');
          const DeleteProfileRoute().go(context);
        },
      ),
    ],
  );
}
