import 'package:dhyana/core/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

mixin AuthRedirectHook {
  String? authRedirectHook(BuildContext context, GoRouterState state, GoRouteData redirectRoute) {
    final AuthCubit authCubit = context.read<AuthCubit>();
    final bool isAuthenticated = (authCubit.state is AuthStateSignedIn);
    final bool isLoginScreenShown =
        state.matchedLocation == redirectRoute.location;
    if (!isAuthenticated && !isLoginScreenShown) {
      return redirectRoute.location;
    } else {
      return null;
    }
  }
}
