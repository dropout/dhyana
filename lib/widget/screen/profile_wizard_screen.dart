import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/enum/loading_state.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_edit_form.dart';
import 'package:dhyana/widget/screen/all.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProfileWizardScreen extends StatefulWidget {

  const ProfileWizardScreen({super.key});

  @override
  State<ProfileWizardScreen> createState() => _ProfileWizardScreenState();
}

class _ProfileWizardScreenState extends State<ProfileWizardScreen>
  with DefaultScreenSetupHelpersMixin {

  LoadingState state = LoadingState.idle;
  final GlobalKey<FormBuilderState> formStateKey =
    GlobalKey<FormBuilderState>();

  void _onSave(BuildContext context, Profile profile) {
    FormBuilderState? formState = formStateKey.currentState;
    if (formState != null && formState.saveAndValidate()) {
      setState(() {
        state = LoadingState.loading;
      });
      Map<String, dynamic>? values = formState.value;
      BlocProvider.of<ProfileBloc>(context).add(ProfileEvent.updateProfile(
        profile: profile,
        formData: values,
        completeProfile: true,
        onComplete: (profile) {
          setState(() {
            state = LoadingState.loaded;
          });
        },
        onError: (e, stack) {
          setState(() {
            state = LoadingState.idle;
          });
        },
      ));
    }
  }

  void _onSignOut(BuildContext context) {
    showSignoutDialog(context);
    context.hapticsTap();
  }

  void _onFormChanged(BuildContext context) {
    setState(() {
      state = LoadingState.idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch(state) {
          case ProfileLoadingState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: AppLocalizations.of(context).profileWizardTitle,
                enableScrolling: false,
                useScaffolding: false,
                slivers: [
                  buildLoadingSliver(context),
                ],
              ),
            );
          case ProfileErrorState():
            return buildScaffolding(
              context,
              DefaultScreenSetup(
                title: AppLocalizations.of(context).profileWizardTitle,
                enableScrolling: false,
                useScaffolding: false,
                slivers: [
                  buildErrorSliver(context),
                ],
              ),
            );
          case ProfileLoadedState():
            return buildScaffolding(
                context,
                DefaultScreenSetup(
                  title: AppLocalizations.of(context).profileWizardTitle,
                  useScaffolding: false,
                  slivers: [

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppThemeData.paddingLg,
                        ),
                        child: ProfileEditForm(
                          profile: state.profile,
                          formStateKey: formStateKey,
                          onChanged: () => _onFormChanged(context),
                        ),
                      ),
                    ),

                    SliverSafeArea(
                        top: false,
                        sliver: SliverToBoxAdapter(
                          // The layout widgets below are needed to
                          // restrict button size to its content,
                          // otherwise the button would end up
                          // using the whole width.
                          child: SizedBox(
                            height: AppThemeData.spacing4xl,
                            child: Center(
                              child: TextButton(
                                onPressed: () => _onSignOut(context),
                                child: Text(
                                  AppLocalizations.of(context).signOut.toUpperCase(),
                                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                    ),

                  ],
                ),
                actionButtonLayer: SafeArea(
                  top: false,
                  child: Align(
                    alignment: const Alignment(0.0, 1.0),
                    child: buildOverlayActionButton(
                      context,
                      state.profile
                    ),
                  ),
                )
            );
          default:
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).editProfile,
              enableScrolling: false,
            );
        }
      },
    );
  }

  Widget buildScaffolding(
      BuildContext context,
      Widget contentLayer,
      {Widget? actionButtonLayer}
      ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          contentLayer,
          actionButtonLayer ?? Align(
            // alignment: const Alignment(1.0, 0.0),
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppThemeData.paddingXl),
              child: actionButtonLayer,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOverlayActionButton(BuildContext context, Profile profile) {
    switch (state) {
      case LoadingState.idle:
        return AppButton(
          text: AppLocalizations.of(context).profileSaveButtonIdle.toUpperCase(),
          onTap: () => _onSave(context, profile),
        );
      case LoadingState.loading:
        return AppButton(
          text: AppLocalizations.of(context).profileSaveButtonSaving.toUpperCase(),
        );
      case LoadingState.loaded:
        return AppButton(
          text: AppLocalizations.of(context).profileSaveButtonSaved.toUpperCase(),
          bColor: Colors.green.shade600,
        );
    }
  }

}










//
//
//
// class ProfileWizardScreen extends StatelessWidget {
//
//   final String profileId;
//
//   const ProfileWizardScreen({
//     required this.profileId,
//     super.key
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       extendBodyBehindAppBar: true,
//       appBar: const CustomAppBar(
//         leading: CustomBackButton(),
//       ),
//       body: buildBody(context)
//       // body: ProfileBlocProvider(
//       //   initialEvent: LoadProfile(profileId: profileId),
//       //   child: buildBody(context),
//       // )
//     );
//   }
//
//   Widget buildBody(BuildContext context, ) {
//     return BlocBuilder<ProfileBloc, ProfileState>(
//       builder: (BuildContext context, ProfileState state) {
//         switch(state) {
//           case ProfileLoadingState():
//             return const AppLoadingDisplay();
//           case ProfileErrorState():
//             return const AppErrorDisplay();
//           case ProfileLoadedState():
//             // return const AppErrorDisplay();
//             return buildLoaded(context, state);
//           default:
//             return const SizedBox.shrink();
//         }
//       },
//     );
//   }
//
//   Widget buildLoaded(BuildContext context, ProfileLoadedState state) {
//     return SafeArea(
//       child: Stack(
//         fit: StackFit.expand,
//         clipBehavior: Clip.none,
//         children: [
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const SizedBox(height: AppThemeData.spacingXl),
//               Text(
//                 AppLocalizations.of(context).profileWizardTitle,
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                   fontWeight: FontWeight.bold,
//                 )
//               ),
//               Expanded(
//                 child: ProfileWizardView(
//                   profile: state.profile,
//                 )
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
// }
