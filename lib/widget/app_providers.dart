import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/bloc/remote_settings/remote_settings_cubit.dart';
import 'package:dhyana/init/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

/// Provides the top-level providers for the app, such as repositories,
/// services and blocs.
class AppProviders extends StatelessWidget {

  final InitResult initResult;
  final Widget child;

  const AppProviders({
    required this.initResult,
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<InitResult>.value(value: initResult),
        Provider<Services>.value(value: initResult.services),
        Provider<Repositories>.value(value: initResult.repositories),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (_) => AuthCubit(
              initialAuthState: (initResult.user != null) ? AuthState.signedIn(user: initResult.user!) : const AuthState.initial(),
              authenticationRepository: initResult.repositories.authRepository,
              analyticsService: initResult.services.analyticsService,
              crashlyticsService: initResult.services.crashlyticsService,
            ),
            lazy: false,
          ),
          BlocProvider<ProfileCubit>(create: (_) => initResult.profileCubit),
          BlocProvider<RemoteSettingsCubit>(
            create: (_) => RemoteSettingsCubit(
              initialRemoteSettings: initResult.remoteSettings,
              remoteSettingsService: initResult.services.remoteSettingsService,
              crashlyticsService: initResult.services.crashlyticsService,
            ),
            lazy: false,
          ),
        ],
        child: child,
      )
    );
  }

}
