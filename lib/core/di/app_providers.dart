import 'package:dhyana/core/presentation/viewmodel/auth/auth_cubit.dart';
import 'package:dhyana/core/presentation/viewmodel/profile/profile_cubit.dart';
import 'package:dhyana/core/presentation/viewmodel/remote_settings/remote_settings_cubit.dart';
import 'package:dhyana/core/bootstrap/init_result.dart';
import 'package:dhyana/core/di/repositories.dart';
import 'package:dhyana/core/di/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

/// Provides the top-level providers for the app, such as repositories,
/// services and blocs.
class AppProviders extends StatelessWidget {
  final InitResult initResult;
  final Widget child;

  const AppProviders({
    required this.initResult,
    required this.child,
    super.key,
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
            create: (_) => GetIt.I.get<AuthCubit>(
              param1: (initResult.userId != null)
                  ? AuthState.signedIn(userId: initResult.userId!)
                  : const AuthState.initial(),
              )

          ),
          BlocProvider<ProfileCubit>(
            create: (_) {
              // TODO: Move to start app usecase?
              final profileCubit = GetIt.I.get<ProfileCubit>();
              if (initResult.userId != null) {
                profileCubit.loadProfile(initResult.userId!);
              }
              return profileCubit;
            },
          ),
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
      ),
    );
  }
}
