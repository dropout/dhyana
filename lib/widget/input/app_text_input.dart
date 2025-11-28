import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/input/all.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AppTextInput extends StatelessWidget {

  final String name;
  final String label;
  final String? initialValue;
  final Function(String?)? onChanged;
  final FormFieldValidator<String>? validator;

  const AppTextInput({
    required this.name,
    required this.label,
    this.initialValue,
    this.onChanged,
    this.validator,
    super.key
  });

  @override
  Widget build(BuildContext context) {
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
          initialValue: initialValue,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
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
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          // cursorHeight: 18.0,
        ),

        Gap.xs(),

        // Render error text separately so that the
        // TextInput's height doesn't change on error
        // Also defer the building after everything else
        // in the current level of context.
        Builder(builder: (context) {
          final fbState = FormBuilder.of(context);
          final fieldState = fbState?.fields[name];
          final errorText = fieldState?.errorText;

          if (errorText == null) {
            return const SizedBox.shrink();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppThemeData.paddingMd),
            child: Text(
              errorText,
              style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
            ),
          );
        }),

      ]
    );
  }
}
