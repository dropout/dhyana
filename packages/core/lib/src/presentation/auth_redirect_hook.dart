import 'package:core/core.dart';
import 'package:core/src/presentation/viewmodel/auth_state_cubit.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// TODO: Check for redundancy in module based routes auth redirect hook usage
mixin AuthRedirectHook {
  String? authRedirectHook(BuildContext context, GoRouterState state) {
    final loginLocation = '/login';
    final AuthStateCubit authCubit = context.read<AuthStateCubit>();
    final bool isAuthenticated = (authCubit.state is AuthStateSignedIn);
    final bool isLoginScreenShown =
        state.matchedLocation == loginLocation;
    if (!isAuthenticated && !isLoginScreenShown) {
      return loginLocation;
    } else {
      return null;
    }
  }
}
