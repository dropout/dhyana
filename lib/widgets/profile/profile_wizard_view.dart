import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:dhyana/widgets/util/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import 'profile_edit_form.dart';

enum _State {
  idle,
  loading,
  updated,
}

class ProfileWizardView extends StatefulWidget {

  final Profile profile;
  final GlobalKey<FormBuilderState> formStateKey =
  GlobalKey<FormBuilderState>();

  ProfileWizardView({
    required this.profile,
    super.key
  });

  @override
  State<ProfileWizardView> createState() => _ProfileWizardViewState();
}

class _ProfileWizardViewState extends State<ProfileWizardView> {

  _State buttonState = _State.idle;

  void onSave(BuildContext context) {
    setState(() {
      buttonState = _State.loading;
    });
    Profile profile = widget.profile;
    FormBuilderState? formState = widget.formStateKey.currentState;
    if (formState != null && formState.saveAndValidate()) {
      Map<String, dynamic>? values = formState.value;
      BlocProvider.of<ProfileBloc>(context).add(ProfileEvent.updateProfile(
        profile: profile,
        formData: values,
        completeProfile: true,
        onComplete: (profile) {
          setState(() {
            buttonState = _State.updated;
          });
        },
        onError: (e, stack) {
          setState(() {
            buttonState = _State.idle;
          });
        },
      ));
    }
  }

  void onSignOut(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(const AuthEvent.signOut());
    context.pop();
  }

  void onFormChanged(BuildContext context) {
    setState(() {
      buttonState = _State.idle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppThemeData.spacingMd),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Column(
                children: [
                  ProfileEditForm(
                    profile: widget.profile,
                    formStateKey: widget.formStateKey,
                    onChanged: () => onFormChanged(context),
                  ),
                  SizedBox(
                    height: AppThemeData.spacing2xl,
                    child: Center(
                      child: TextButton(
                        onPressed: () => onSignOut(context),
                        child: Text(
                          'SIGN OUT',
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
          Column(
            children: [
              buildActionButton(context),
            ],
          )
        ],
      ),
    );
  }

  Widget buildActionButton(BuildContext context) {
    switch (buttonState) {
      case _State.idle:
        return AppButton(
          text: 'SAVE',
          onTap: () => onSave(context),
        );
      case _State.loading:
        return AppButton(
          text: 'SAVING...',
        );
      case _State.updated:
        return AppButton(
          text: 'SAVED!',
          bColor: Colors.green.shade600,
        );
    }
  }

}

//
// class ProfileEditView extends StatelessWidget {
//
//   final Profile profile;
//   final GlobalKey<FormBuilderState> formStateKey =
//     GlobalKey<FormBuilderState>();
//
//   ProfileEditView({
//     required this.profile,
//     super.key
//   });
//
//   void onSave(BuildContext context) {
//     FormBuilderState? formState = formStateKey.currentState;
//     if (formState != null && formState.saveAndValidate()) {
//       Map<String, dynamic>? values = formState.value;
//       BlocProvider.of<ProfileBloc>(context).add(ProfileEvent.updateProfile(
//         profile: profile,
//         formData: values,
//         onComplete: (article) {
//           ScaffoldMessenger.of(context).clearSnackBars();
//           ScaffoldMessenger.of(context).showSnackBar(
//               getSuccessSnackBar(context, 'Profile updated: ${profile.id} - ${profile.displayName}')
//           );
//           BlocProvider.of<ProfileBloc>(context).add(ProfileEvent.loadProfile(profileId: profile.id));
//         },
//         onError: (e, stack) {
//           ScaffoldMessenger.of(context).clearSnackBars();
//           getErrorSnackBar(context, 'Unable to update Profile!');
//         },
//       ));
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Updating profile...')),
//       );
//     }
//   }
//
//   void onSignOut(BuildContext context) {
//     BlocProvider.of<AuthBloc>(context).add(const AuthEvent.signOut());
//     context.pop();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(AppThemeData.spacingMd),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Expanded(
//             child: Column(
//               children: [
//                 ProfileEditForm(
//                   profile: profile,
//                   formStateKey: formStateKey,
//                 ),
//                 SizedBox(
//                   height: AppThemeData.spacing2xl,
//                   child: Center(
//                     child: TextButton(
//                       onPressed: () => onSignOut(context),
//                       child: Text(
//                         'SIGN OUT',
//                         style: Theme.of(context).textTheme.labelLarge!.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ),
//           Column(
//             children: [
//               AppButton(
//                 text: 'SAVE',
//                 onTap: () => onSave(context),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
