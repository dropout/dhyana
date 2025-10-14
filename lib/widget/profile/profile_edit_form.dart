import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/util/all.dart';
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
            context.localizations.profileImageLabel,
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
                  key: const Key('profile_edit_form_image_picker'),
                  name: 'imageData',
                  labelText: context.localizations.profileImageLabel,
                  initialImageUrl: snapshot.data!,
                );
              } else {
                return Container();
              }
            }
          ),
          Gap.medium(),
          ...buildNameInputs(context),
        ],
      )
    );
  }

  List<Widget> buildNameInputs(BuildContext context) {
    // First name first or last name first depending on locale
    Locale locale = Localizations.localeOf(context);
    if (locale.languageCode.toLowerCase() == 'hu' ) {
      return [
        buildTextInput(context,
          name: 'lastName',
          label: context.localizations.profileLastnameLabel,
          controller: lastNameTextController,
          key: const Key('profile_edit_form_last_name_input'),
        ),
        Gap.medium(),
        buildTextInput(context,
          name: 'firstName',
          label: context.localizations.profileFirstnameLabel,
          controller: firstNameTextController,
          key: const Key('profile_edit_form_first_name_input'),
        ),
      ];
    } else {
      return [
        buildTextInput(context,
          name: 'firstName',
          label: context.localizations.profileFirstnameLabel,
          controller: firstNameTextController,
          key: const Key('profile_edit_form_first_name_input'),
        ),
        Gap.medium(),
        buildTextInput(context,
          name: 'lastName',
          label: context.localizations.profileLastnameLabel,
          controller: lastNameTextController,
          key: const Key('profile_edit_form_last_name_input'),
        ),
      ];
    }
  }

  Widget buildTextInput(BuildContext context, {
    required String name,
    required String label,
    required TextEditingController controller,
    Key? key,
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
          key: key,
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
