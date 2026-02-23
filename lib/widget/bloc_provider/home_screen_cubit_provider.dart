import 'package:dhyana/bloc/home_screen/home_screen_cubit.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This typedef defines the signature of the builder function used in the [HomeScreenCubitProvider].
typedef HomeScreenCubitProviderBuilder = Widget Function(BuildContext context, HomeScreenState state);

/// This typedef defines the signature of the onCreate callback used in the [HomeScreenCubitProvider].
typedef HomeScreenCubitProviderOnCreate = void Function(BuildContext context, HomeScreenCubit cubit);

/// Provides a state for the home screen, and enables to build on
/// top of the state immediately.
class HomeScreenCubitProvider extends StatelessWidget {

  /// The builder used to build on top of the state provided by the [HomeScreenCubit].
  final HomeScreenCubitProviderBuilder builder;

  /// Callback used to do something with the cubit immediately after it has been created, e.g. call an init function on it.
  final HomeScreenCubitProviderOnCreate? onCreate;

  const HomeScreenCubitProvider({
    required this.builder,
    this.onCreate,
    super.key,
  });

  /// The [Builder] makes it possible to use the [HomeScreenCubit]
  /// and build on its state on 'the same level' as the [HomeScreenCubitProvider].
  /// Without the [Builder], the [HomeScreenCubit] would only be available in the
  /// widgets below the [HomeScreenCubitProvider] in the widget tree, and not in the
  /// widgets that are on the same level as the [HomeScreenCubitProvider] (e.g. the [Scaffold] in the [HomeScreen]).
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenCubit>(
      create: (ctx) {
        final hsCubit = HomeScreenCubit(
          sharedPreferencesService: context.services.sharedPreferencesService,
          crashlyticsService: context.services.crashlyticsService,
        );
        onCreate?.call(ctx, hsCubit);
        return hsCubit;
      },
      child: Builder(
        builder: (context) => BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
            return builder(context, state);
          }
        )
      )
    );

  }
}
