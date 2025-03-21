import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/form_builder_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ProfileEditForm extends StatefulWidget {

  final Profile profile;
  final void Function()? onChanged;
  final GlobalKey<FormBuilderState>? formStateKey;

  const ProfileEditForm({
    required this.profile,
    this.formStateKey,
    this.onChanged,
    super.key
  });

  @override
  State<ProfileEditForm> createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {

  late final GlobalKey<FormBuilderState> _formKey;
  late final TextEditingController firstNameTextController =
    TextEditingController();
  late final TextEditingController lastNameTextController =
    TextEditingController();

  @override
  void initState() {
    _formKey = widget.formStateKey ?? GlobalKey<FormBuilderState>();
    firstNameTextController.text = widget.profile.firstName;
    lastNameTextController.text = widget.profile.lastName;
    super.initState();
  }

  void onFormChanged(BuildContext context) {
    widget.onChanged?.call();
  }

  String _getLiveDisplayName(BuildContext context) {
    return '${firstNameTextController.text} ${lastNameTextController.text}';
  }

  @override
  Widget build(BuildContext context) {
    var profile = widget.profile;
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      skipDisabled: true,
      onChanged: () => onFormChanged(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder(
            future: Future.value(profile.photoUrl),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('error');
              }
              if (snapshot.hasData) {
                return FormBuilderImagePicker(
                  name: 'imageData',
                  labelText: 'Profile image',
                  initialImageUrl: snapshot.data!,
                );
              } else {
                return Container();
              }
            }
          ),
          buildNameDisplay(context),
          FormBuilderTextField(
            name: 'firstName',
            controller: firstNameTextController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).profileFirstnameLabel
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          FormBuilderTextField(
            name: 'lastName',
            controller: lastNameTextController,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).profileLastnameLabel,
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            keyboardType: TextInputType.text,
          ),
        ],
      )
    );
  }

  Widget buildNameDisplay(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppThemeData.spacingMd),
      child: Text(
        _getLiveDisplayName(context),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.bold,
        )
      ),
    );
  }

}
