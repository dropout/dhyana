import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_bar/all.dart';
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
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        leading: CustomBackButton(),
      ),
      body: ProfileBlocProvider(
        initialEvent: LoadProfile(profileId: profileId),
        child: buildBody(context),
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
            // return const AppErrorDisplay();
            return buildLoaded(context, state);
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget buildLoaded(BuildContext context, ProfileLoadedState state) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: AppThemeData.spacingXl),
              Text(
                AppLocalizations.of(context).profileWizardTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                )
              ),
              Expanded(
                child: ProfileWizardView(
                  profile: state.profile,
                )
              )
            ],
          )
        ],
      ),
    );
  }

}
