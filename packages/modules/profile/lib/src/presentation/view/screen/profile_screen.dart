import 'package:core/core.dart';

import 'package:profile/l10n/profile_localizations.dart';
import 'package:profile/src/presentation/view/profile_view.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/public/viewmodel/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {

  final String profileId;

  const ProfileScreen({
    required this.profileId,
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
  with DefaultScreenSetupHelpersMixin {

  @override
  initState() {
    context.read<ProfileCubit>().loadProfile(widget.profileId);
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
              scrollPhysics: const NeverScrollableScrollPhysics(),
              enableTitleSliver: false,
              enableAppBarSliver: false,
              slivers: [
                buildLoadingSliver(context)
              ],
            );
          case ProfileLoadedState():
            return DefaultScreenSetup(
              key: const Key('profile_screen'),
              title: ProfileLocalizations.of(context).profile,
              enableTitleSliver: false,
              enableAppBarSliver: false,
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
              enableTitleSliver: false,
              enableAppBarSliver: false,
              scrollPhysics: const NeverScrollableScrollPhysics(),
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
              ],
            );
          case ProfileStateInitial():
            return DefaultScreenSetup(
              key: const Key('profile_screen'),
              scrollPhysics: const NeverScrollableScrollPhysics(),
              enableAppBarSliver: false,
              title: '',
            );
        }
      },
    );
  }
}
