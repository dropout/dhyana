import 'package:core/core.dart';

import 'package:profile/l10n/profile_localizations.dart';
import 'package:profile/src/presentation/view/profile_view.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/public/model/profile.dart';
import 'package:profile/src/public/viewmodel/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {

  final String profileId;
  final Profile? profile;

  const ProfileScreen({
    required this.profileId,
    this.profile,
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
  with DefaultScreenSetupHelpersMixin {

  @override
  initState() {
    BlocProvider.of<ProfileCubit>(context).loadProfile(
      widget.profileId,
      profile: widget.profile,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch (state) {
          case ProfileLoadingState():
            return DefaultScreenSetup(
              key: const Key('profile_screen'),
              title: ProfileLocalizations.of(context).profile,
              enableScrolling: false,
              enableTitleSliver: false,
              slivers: [
                buildLoadingSliver(context)
              ],
            );
          case ProfileLoadedState():
            return DefaultScreenSetup(
            key: const Key('profile_screen'),
              title: ProfileLocalizations.of(context).profile,
              enableTitleSliver: false,
              slivers: [
                SliverSafeArea(
                  top: false,
                  sliver: SliverToBoxAdapter(
                    child: ProfileView(
                      profile: state.profile,
                    ),
                  ),
                )
              ],
            );
          case ProfileErrorState():
            return DefaultScreenSetup(
              key: const Key('profile_screen'),
              title: ProfileLocalizations.of(context).profile,
              titleColor: Colors.white,
              enableTitleSliver: false,
              backgroundColor: Theme.of(context).colorScheme.error,
              appBarBackgroundColor: Theme.of(context).colorScheme.error,
              backButton: CustomBackButton.light(),
              enableScrolling: false,
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: AppErrorDisplay(
                    onButtonTap: () {
                      context.read<AuthStateCubit>().signOut();
                      context.services.homeNavigator.navigateToHome(type: .go);
                      context.read<ProfileCubit>().clearData();
                    },
                    buttonText: context.coreL10n.profileSignoutTitle,
                  ),
                )
                // buildErrorSliver(context),
              ],
            );
          case ProfileStateInitial():
            return DefaultScreenSetup(
              key: const Key('profile_screen'),
              enableScrolling: false,
              title: '',
            );
        }
      },
    );
  }
}
