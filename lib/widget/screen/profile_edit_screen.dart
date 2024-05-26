import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/l10n/app_localizations.dart';
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: CustomAppBar(titleText: AppLocalizations.of(context).editProfile),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: ProfileBlocProvider(
            initialEvent: ProfileEvent.loadProfile(profileId: user.uid),
            child: buildState(context),
          ),
        )
      );
    });
  }

  Widget buildState(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch(state) {
          case ProfileLoadingState():
            return const AppLoadingDisplay();
          case ProfileErrorState():
            return const AppErrorDisplay();
          case ProfileLoadedState():
            return ProfileEditView(profile: state.profile);
        }
      },
    );
  }

}
