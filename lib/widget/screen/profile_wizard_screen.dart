import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/widget/app_bar/custom_back_button.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/bloc_provider/profile_bloc_provider.dart';
import 'package:dhyana/widget/profile/profile_wizard_view.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileWizardScreen extends StatelessWidget {

  final String profileId;

  const ProfileWizardScreen({
    required this.profileId,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: ProfileBlocProvider(
          initialEvent: LoadProfile(profileId: profileId),
          child: buildBody(context),
        ),
      )
    );
  }

  Widget buildBody(BuildContext context, ) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch(state) {
          case ProfileLoadingState():
            return const AppLoadingDisplay();
          case ProfileErrorState():
            return const AppErrorDisplay();
          case ProfileLoadedState():
            return buildLoaded(context, state);
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget buildLoaded(BuildContext context, ProfileLoadedState state) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        const CustomBackButton(),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: AppThemeData.spacing3xl),
            Text(
              'Complete your profile!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge
            ),
            Expanded(
              child: ProfileWizardView(
                profile: state.profile,
              )
            )
          ],
        )
      ],
    );
  }

}
