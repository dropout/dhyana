import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/form_builder_image_picker.dart';
import 'package:dhyana/widget/util/gap.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).profileImageLabel,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Gap.xs(),
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
          // buildNameDisplay(context),
          Gap.medium(),
          ...buildNameInputs(context),
        ],
      )
    );
  }

  List<Widget> buildNameInputs(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    if (locale.languageCode.toLowerCase() == 'hu' ) {
      return [
        buildTextInput(context,
          name: 'lastName',
          label: AppLocalizations.of(context).profileLastnameLabel,
          controller: lastNameTextController
        ),
        Gap.medium(),
        buildTextInput(context,
          name: 'firstName',
          label: AppLocalizations.of(context).profileFirstnameLabel,
          controller: firstNameTextController
        ),
      ];
    } else {
      return [
        buildTextInput(context,
          name: 'firstName',
          label: AppLocalizations.of(context).profileFirstnameLabel,
          controller: firstNameTextController
        ),
        Gap.medium(),
        buildTextInput(context,
          name: 'lastName',
          label: AppLocalizations.of(context).profileLastnameLabel,
          controller: lastNameTextController
        ),
      ];
    }
  }

  Widget buildTextInput(BuildContext context, {
    required String name,
    required String label,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Gap.xs(),
        FormBuilderTextField(
          name: name,
          controller: controller,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.backgroundPaperLight,
                width: 2.0,
              ),
            ),
            fillColor: AppColors.backgroundPaperLight,
            filled: true,
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        ),
      ]
    );
  }

}
