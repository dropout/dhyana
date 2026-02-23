import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/model/profile_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef SafeProfileSettingsBuilder = Widget Function(BuildContext context, ProfileSettings settings);

class SafeProfileSettings extends StatelessWidget {

  final SafeProfileSettingsBuilder builder;

  const SafeProfileSettings({
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return switch (state) {
          ProfileLoadedState() => builder(context, state.settings),
          _ => builder(context, const ProfileSettings(id: 'anonymous')),
        };
      }
    );
  }
}
