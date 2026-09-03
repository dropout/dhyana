import 'package:timer/l10n/timer_localizations.dart';

import 'package:core/src/presentation/design_spec.dart';
import 'package:core/src/presentation/view/util/app_context.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:timer/src/public/view/timer_settings/duration_input_view.dart';

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
              title: label,
              initialValue: field.value?.inMinutes,
              onSelect: (duration) {
                field.didChange(duration);
                context.pop();
              },
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
                        ? '${field.value!.inSeconds}${TimerLocalizations.of(field.context).secondsAbbr}'
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
