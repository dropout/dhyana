import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/dialog/image_upload_not_safe_dialog.dart';
import 'package:dhyana/widget/dialog/photo_access_denied_dialog.dart';
import 'package:dhyana/widget/input/app_text_input.dart';
import 'package:dhyana/widget/input/form_builder_city_selector.dart';
import 'package:dhyana/widget/input/form_builder_profile_image_picker.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/dialog_helper.dart';
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

  @override
  void initState() {
    _formKey = widget.formStateKey ?? GlobalKey<FormBuilderState>();
    super.initState();
  }

  void onFormChanged(BuildContext context) {
    widget.onChanged?.call();
  }

  void showImageErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('error uploading image'),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void onProfileImagePickerError(
    BuildContext context,
    ProfileImagePickerError errorType,
    dynamic error
  ) {
    switch (errorType) {
      case ProfileImagePickerError.photoAccessDenied:
        showAppDialog(context, const PhotoAccessDeniedDialog());
        break;
      case ProfileImagePickerError.notSafeImage:
        showAppDialog(context, const ImageUploadNotSafeDialog());
      default:
        showImageErrorSnackBar(context);
    }
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
            context.l10n.profileImageLabel,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Gap.xs(),
          FormBuilderProfileImagePicker(
            key: const Key('profile_edit_form_image_picker'),
            name: 'imageData',
            label: context.l10n.profileImageLabel,
            profile: profile,
            onError: (errorType, error) => onProfileImagePickerError(context, errorType, error),
          ),
          Gap.medium(),
          ...buildNameInputs(context),
          Gap.medium(),
          FormBuilderCitySelector(
            name: 'location',
            label: context.l10n.profileLocationLabel,
            key: const Key('profile_edit_form_location_input'),
            initialValue: profile.location,
            onChanged: (_) =>
              _formKey.currentState?.fields['location']?.validate(),
          ),
        ],
      )
    );
  }

  // First name first or last name first depending on locale
  List<Widget> buildNameInputs(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    if (locale.languageCode.toLowerCase() == 'hu' ) {
      return [
        AppTextInput(
          name: 'lastName',
          label: context.l10n.profileLastnameLabel,
          key: const Key('profile_edit_form_last_name_input'),
          initialValue: widget.profile.lastName,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
          onChanged: (_) =>
            _formKey.currentState?.fields['lastName']?.validate(),
        ),
        Gap.medium(),
        AppTextInput(
          name: 'firstName',
          label: context.l10n.profileFirstnameLabel,
          key: const Key('profile_edit_form_first_name_input'),
          initialValue: widget.profile.firstName,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
          onChanged: (_) =>
            _formKey.currentState?.fields['firstName']?.validate(),
        ),
      ];
    } else {
      return [
        AppTextInput(
          name: 'firstName',
          label: context.l10n.profileFirstnameLabel,
          key: const Key('profile_edit_form_first_name_input'),
          initialValue: widget.profile.firstName,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
          onChanged: (_) =>
            _formKey.currentState?.fields['firstName']?.validate(),
        ),
        Gap.medium(),
        AppTextInput(
          name: 'lastName',
          label: context.l10n.profileLastnameLabel,
          key: const Key('profile_edit_form_last_name_input'),
          initialValue: widget.profile.lastName,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
          onChanged: (_) =>
            _formKey.currentState?.fields['lastName']?.validate(),
        ),
      ];
    }
  }

}
