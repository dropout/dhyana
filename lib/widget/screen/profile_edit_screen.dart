import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/bloc_provider/profile_bloc_provider.dart';
import 'package:dhyana/widget/profile/profile_edit_view.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:dhyana/widget/util/custom_app_bar.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SignedIn(yes: (BuildContext context, User user) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ProfileBlocProvider(
          initialEvent: ProfileEvent.loadProfile(profileId: user.uid),
          child: buildBody(context),
        )
      );
    });
  }

  Widget buildBody(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch(state) {
          case ProfileLoadingState():
            return const AppLoadingDisplay();
          case ProfileErrorState():
            return const AppErrorDisplay();
          case ProfileLoadedState():
            return buildLoaded(context, state);
        }
      },
    );
  }

  Widget buildLoaded(BuildContext context, ProfileLoadedState state) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppThemeData.spacing3xl),
            Expanded(
              child: ProfileEditView(
                profile: state.profile
              )
            )
          ],
        ),
        const CustomAppBar(title: 'Edit Profile'),
      ],
    );
  }
}
