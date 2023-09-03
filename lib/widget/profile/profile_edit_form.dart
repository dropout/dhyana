import 'package:dhyana/model/profile.dart';
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

  @override
  void initState() {
    _formKey = widget.formStateKey ?? GlobalKey<FormBuilderState>();
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
        children: [
          FutureBuilder(
            future: Future.value(profile.photoUrl),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('error');
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
          FormBuilderTextField(
            name: 'firstName',
            decoration: const InputDecoration(labelText: 'Firstname'),
            initialValue: profile.firstName,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          FormBuilderTextField(
            name: 'lastName',
            decoration: const InputDecoration(labelText: 'Lastname'),
            initialValue: profile.lastName,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 16),
        ],
      )
    );
  }

}
