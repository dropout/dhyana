import 'dart:io';

import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/delete_user/delete_user_cubit.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/widget/app_bar/all.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DeleteProfileScreen extends StatelessWidget {
  const DeleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    CrashlyticsService crashlyticsService =
      context.services.crashlyticsService;

    AuthRepository authRepository =
      context.repos.authRepository;

    ProfileRepository profileRepository =
      context.repos.profileRepository;

    return BlocProvider<DeleteUserCubit>(
      create: (_) {
        return DeleteUserCubit(
          authRepository: authRepository,
          profileRepository: profileRepository,
          crashlyticsService: crashlyticsService,
        )..deleteUser();
      },
      child: const DeleteProfileScreenContent()
    );
  }
}

class DeleteProfileScreenContent extends StatelessWidget {
  const DeleteProfileScreenContent({super.key});

  void _signInWithGoogle(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      AuthEvent.signinWithGoogle(
        onComplete: (user, _) => _onSigninCompleted(context, user)
      )
    );
    context.services.analyticsService
      .logEvent(name: 'login_with_google_button_pressed');
  }

  void _signInWithApple(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      AuthEvent.signinWithApple(
        onComplete: (user, _) => _onSigninCompleted(context, user)
      )
    );
    context.services.analyticsService
      .logEvent(name: 'login_with_apple_button_pressed');
  }

  void _onSigninCompleted(BuildContext context, User user) {
    BlocProvider.of<DeleteUserCubit>(context).deleteUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return BlocBuilder<DeleteUserCubit, DeleteUserState>(
          builder: (context, deleteProfileState) {
            bool showBackButton = false;
            Widget body = Container();

            if (deleteProfileState is DeleteUserErrorState) {
              body = AppErrorDisplay(
                onButtonTap: () {
                  GoRouter.of(context).pop();
                },
              );
            }

            if (deleteProfileState is DeleteUserLoadingState) {
              body = const AppLoadingDisplay();
            }

            if (deleteProfileState is DeleteUserAuthRequiredState) {
              if (authState is AuthStateSigningIn) {
                body = const AppLoadingDisplay();
              } else {
                showBackButton = true;
                body = buildReauthScreen(context);
              }
            }

            if (deleteProfileState is DeleteUserCompletedState) {
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
                    BlocProvider.of<AuthBloc>(context).add(AuthEvent.signOut());
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
