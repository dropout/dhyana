import 'package:dhyana/util/duration.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/timer/settings/duration_input_view.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

/// A [FormBuilderField] that displays a [DurationInput] and integrates
/// with [FormBuilder] for form state management.
class FormBuilderDurationInput extends FormBuilderField<Duration> {
  
  final String label;
  final List<int>? availableValues;

  FormBuilderDurationInput({
    required this.label,
    this.availableValues,
    // From Super
    required super.name,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.enabled,
    super.initialValue,
    super.focusNode,
    super.onSaved,
    super.validator,
    super.onChanged,
    super.valueTransformer,
    super.onReset,
    super.key,
  }) : super(
    builder: (FormFieldState<Duration?> field) {
      return GestureDetector(
        behavior: .opaque,
        onTap: () {
          field.context.services.overlayService.showModalBottomSheet(
            field.context,
            (context) => DurationInputView(
              availableValues: defaultChantGapSelectorValues,
              title: label,
              initialValue: field.value ?? Duration.zero,
              onSelect: (duration) {
                field.didChange(duration);
                context.pop();
              },
              durationFormatter: (d, isSelected) {
                return isSelected
                  ? field.context.l10n.secondsPluralWithNumber(d.inSeconds)
                  : d.inSeconds.toString();
              }
            ),
          );
          field.context.hapticsTap();

        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: DesignSpec.paddingXl),
          child: Wrap(            
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: DesignSpec.paddingLg,
            alignment: .spaceBetween,
            children: [
              Text(label, style: field.context.theme.textTheme.labelLarge),          
              Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,                      
                  ),
                  children: [
                    TextSpan(
                      text: field.value != null
                        ? '${field.value!.inSeconds}${field.context.l10n.secondsAbbr}'
                        : 'N/A',                      
                    ),
                    WidgetSpan(
                      child: Icon(
                        Icons.chevron_right_rounded, 
                        size: 32,
                        color: Colors.black54,
                      ),
                      baseline: .ideographic,
                      alignment: .middle,
                    ),
                  ]
                ),
                textAlign: TextAlign.end,                  
              ),
            ],
          ),
        ),
      );

    },
  );

  @override
  FormBuilderDurationInputState createState() =>
    FormBuilderDurationInputState();
}

class FormBuilderDurationInputState
  extends FormBuilderFieldState<FormBuilderDurationInput, Duration> {}
