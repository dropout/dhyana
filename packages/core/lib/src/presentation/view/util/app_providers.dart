import 'package:core/src/presentation/viewmodel/auth_state_cubit.dart';
import 'package:core/src/presentation/viewmodel/profile_state_cubit.dart';
import 'package:core/src/presentation/viewmodel/remote_settings_cubit.dart';
import 'package:dhyana/bootstrap/init_result.dart';
import 'package:core/src/util/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

/// Application top-level providers for the app.
/// Enables global access to services, cubits for the UI.
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
          BlocProvider<AuthStateCubit>(
            create: (_) => GetIt.I.get<AuthStateCubit>(
              param1: (initResult.userId != null)
                  ? AuthState.signedIn(userId: initResult.userId!)
                  : const AuthState.initial(),
              )
          ),
          BlocProvider<ProfileStateCubit>(
            create: (_) {
              // TODO: Move to start app usecase?
              final profileCubit = GetIt.I.get<ProfileStateCubit>();
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
