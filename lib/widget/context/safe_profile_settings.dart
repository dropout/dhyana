import 'package:dhyana/modules/account/presentation/bloc/profile/profile_cubit.dart';
import 'package:dhyana/modules/account/domain/model/profile_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef SafeProfileSettingsBuilder = Widget Function(BuildContext context, ProfileSettings settings);

/// A widget that provides a safe way to access profile settings. 
/// If the profile is not loaded, or not available (e.g. user is not signed in), 
/// it will provide a default anonymous profile settings object.
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
