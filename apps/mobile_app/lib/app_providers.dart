import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:profile/profile.dart';
import 'package:provider/provider.dart';

import 'package:dhyana/bootstrap/init_result.dart';


/// Application top-level providers.
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
        child: ShaderRenderingScope(
          enabled: true,
          child: child,
        ),
      ),
    );
  }
}
