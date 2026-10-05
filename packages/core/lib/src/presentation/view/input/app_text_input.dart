import 'package:core/src/presentation/design_spec.dart';
import 'package:core/src/presentation/view/util/gap.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'decoration.dart';

class const AppTextInput({
  required final String name,
  required final String label,
  final Key? formFieldKey,
  final bool obscureText = false,
  final String? initialValue,
  final Function(String?)? onChanged,
  final FormFieldValidator<String>? validator,
  final TextInputType keyboardType = TextInputType.text,
  super.key,
}) extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label, 
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.charcoal,
          )
        ),
        Gap.xs(),
        FormBuilderTextField(
          key: formFieldKey,
          name: name,
          obscureText: obscureText,
          initialValue: initialValue,
          keyboardType: keyboardType,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          onChanged: onChanged,
          textAlignVertical: TextAlignVertical.center,
          decoration: getTextInputDecoration(context),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
          ]),
          // Mute default error text to avoid height changes
          // that would cause the TextField to shrink.
          // Instead, we render the error text separately below.
          errorBuilder: (_, _) => SizedBox.shrink(),
        ),
        Gap.xs(),
        // Render error text separately so that the
        // TextInput's height doesn't change on error
        // Also defer the building after everything else
        // in the current level of context.
        Builder(
          builder: (context) {
            final fbState = FormBuilder.of(context);
            final fieldState = fbState?.fields[name];
            final errorText = fieldState?.errorText;

            if (errorText == null) {
              return const SizedBox.shrink();
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: DesignSpec.paddingMd),
              child: Text(
                errorText,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(                  
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
