import 'package:core/core.dart';
import 'package:auth/l10n/auth_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginWithEmailAndPasswordForm extends StatefulWidget {
  final void Function()? onChanged;
  final GlobalKey<FormBuilderState>? formStateKey;

  const LoginWithEmailAndPasswordForm({
    this.onChanged, 
    this.formStateKey, 
    super.key
  });
  
  @override
  State<LoginWithEmailAndPasswordForm> createState() => 
    _LoginWithEmailAndPasswordFormState();
}

class _LoginWithEmailAndPasswordFormState 
  extends State<LoginWithEmailAndPasswordForm> {

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
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      skipDisabled: true,
      onChanged: () => onFormChanged(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextInput(          
            name: 'email',
            label: AuthLocalizations.of(context).loginSigninEmailInputLabel,
            formFieldKey: const Key('login_form_email_input'),            
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
            onChanged: (_) =>
              _formKey.currentState?.fields['email']?.validate(),
          ),
          Gap.medium(),
          AppTextInput(
            name: 'password',
            label: AuthLocalizations.of(context).loginSigninPasswordInputLabel,
            obscureText: true,
            formFieldKey: const Key('login_form_password_input'),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            onChanged: (_) =>
              _formKey.currentState?.fields['password']?.validate(),
          ),
        ],
      )
    );
  }

}
