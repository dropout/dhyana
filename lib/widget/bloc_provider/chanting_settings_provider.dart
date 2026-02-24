import 'package:dhyana/bloc/chanting_settings/chanting_settings_cubit.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Signature for the builder function which takes the [BuildContext] and the [ChantingSettingsState] and returns a [Widget].
typedef ChantingSettingsCubitProviderBuilder = Widget Function(
  BuildContext context,
  ChantingSettingsState state,
);

///
class ChantingSettingsCubitProvider extends StatelessWidget {

  final ChantingSettingsCubitProviderBuilder builder;
  final Function(ChantingSettingsCubit)? onCreate;

  const ChantingSettingsCubitProvider({
    required this.builder,
    this.onCreate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChantingSettingsCubit>(
      create: (context) {
        final cubit = ChantingSettingsCubit(
          chantsRepository: context.repos.chantsRepository,
          sharedPreferencesService: context.services.sharedPreferencesService,
          crashlyticsService: context.services.crashlyticsService,
        );
        onCreate?.call(cubit);
        return cubit;
      },
      child: Builder(
        builder: (ctx) => BlocBuilder<ChantingSettingsCubit, ChantingSettingsState>(
          builder: builder,
        ),
      ),
    );
  }

}
