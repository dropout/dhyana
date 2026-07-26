import 'dart:io';

import 'package:dhyana/core/presentation/bloc/auth/auth_bloc.dart';
import 'package:dhyana/modules/profile/di/dependency_injection.dart';
import 'package:dhyana/modules/profile/presentation/viewmodel/delete_user/delete_profile_cubit.dart';
import 'package:dhyana/core/data/datasource/auth/model/user.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/core/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:dhyana/core/presentation/widget/app_bar/custom_back_button.dart';
import 'package:dhyana/core/navigation/app_routes.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/widget/util/app_button.dart';
import 'package:dhyana/core/presentation/widget/util/app_context.dart';
import 'package:dhyana/core/presentation/widget/util/app_error_display.dart';
import 'package:dhyana/core/presentation/widget/util/app_loading_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DeleteProfileScreen extends StatelessWidget {
  const DeleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeleteProfileCubit>(
      create: (_) {
        return getIt.get<DeleteProfileCubit>()..deleteProfile();
      },
      child: const DeleteProfileScreenContent()
    );
  }
}

class DeleteProfileScreenContent extends StatelessWidget {
  const DeleteProfileScreenContent({super.key});

  void _signInWithGoogle(BuildContext context) {
    context.read<AuthCubit>().signInWithGoogle(
      onComplete: (user, _) => _onSigninCompleted(context, user)
    );
    context.services.analyticsService
      .logEvent(name: 'login_with_google_button_pressed');
  }

  void _signInWithApple(BuildContext context) {
    context.read<AuthCubit>().signInWithApple(
      onComplete: (user, _) => _onSigninCompleted(context, user)
    );
    context.services.analyticsService
      .logEvent(name: 'login_with_apple_button_pressed');
  }

  void _onSigninCompleted(BuildContext context, User user) {
    BlocProvider.of<DeleteProfileCubit>(context).deleteProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<DeleteProfileCubit, DeleteProfileState>(
          builder: (context, deleteProfileState) {
            bool showBackButton = false;
            Widget body = Container();

            if (deleteProfileState is DeleteProfileErrorState) {
              body = AppErrorDisplay(
                onButtonTap: () {
                  GoRouter.of(context).pop();
                },
              );
            }

            if (deleteProfileState is DeleteProfileLoadingState) {
              body = const AppLoadingDisplay();
            }

            if (deleteProfileState is DeleteProfileAuthRequiredState) {
              if (authState is AuthStateSigningIn) {
                body = const AppLoadingDisplay();
              } else {
                showBackButton = true;
                body = buildReauthScreen(context);
              }
            }

            if (deleteProfileState is DeleteProfileCompletedState) {
              body = buildCompletedScreen(context);
            }

            Widget? backButton;
            if (showBackButton) {
              backButton = CustomBackButton();
            }
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: CustomAppBar(
                leading: backButton
              ),
              body: body,
            );

          }
        );
      },
    );
  }

  Widget buildReauthScreen(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppThemeData.spacingMd),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: AppThemeData.spacingXl),
                Text(AppLocalizations.of(context).deleteProfileScreenTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    )
                ),
                const SizedBox(height: AppThemeData.spacingSm),
                Text(AppLocalizations.of(context).deleteProfileScreenText,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge
                ),
                const SizedBox(height: AppThemeData.spacingXl),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                      text: AppLocalizations.of(context).loginSigninGoogle,
                      bColor: Colors.black,
                      fColor: Colors.white,
                      onTap: () => _signInWithGoogle(context),
                    ),
                    if (Platform.isIOS) const SizedBox(height: AppThemeData.spacingSm),
                    if (Platform.isIOS) AppButton(
                      text: AppLocalizations.of(context).loginSigninApple,
                      bColor: Colors.black,
                      fColor: Colors.white,
                      onTap: () => _signInWithApple(context),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildCompletedScreen(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(DesignSpec.spacingMd),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context).deleteProfileScreenSuccessTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  )
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: DesignSpec.spacingXl,
              child: Center(
                child: AppButton(
                  onTap: () {
                    context.read<AuthCubit>().signOut();
                    HomeRoute().go(context);
                  },
                  text: AppLocalizations.of(context).deleteProfileScreenOkayButtonText.toUpperCase(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
