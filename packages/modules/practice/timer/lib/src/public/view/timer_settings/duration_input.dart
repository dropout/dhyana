import 'package:material_ui/material_ui.dart';
import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import 'duration_input_view.dart';
import 'input_button.dart';

/// A widget that allows users to select a duration for a timer.
/// By default, it provides options for 1 to 108 minutes.
class const DurationInput({
  /// Label used for input view title.
  required final String label,

  /// The selected duration value.
  required final Duration value,
  
  // To show session start and end time correctly in the input view
  required final Duration preparationTime,
  
  /// The service used to manage overlays, such as showing modal bottom sheets.
  required final OverlayService overlayService,

  /// Minimum duration in minutes. Default is 1.
  /// This ensures that users select a positive duration.
  final int minMinutes = 1,

  /// Maximum duration in minutes. Default is 60.
  /// This provides a reasonable upper limit for timer durations.
  final int maxMinutes = 60,

  /// Callback function that is called when the value changes.
  final void Function(Duration duration)? onChange,
  super.key,
}) extends StatelessWidget {

  void _onSelected(BuildContext context, Duration duration) {
    onChange?.call(duration);
    context.hapticsTap();
    context.pop();
  }

  void _onInputTap(BuildContext context) {
    overlayService.showModalBottomSheet(
      context,
      (context) => DurationInputView(
        title: label,
        initialValue: value.inMinutes,
        preparationTime: preparationTime,
        minMinutes: minMinutes,
        maxMinutes: maxMinutes,
        onSelect: (Duration duration) => _onSelected(context, duration),
      ),
      enableDrag: false,
    );
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return InputButton(
      key: Key('timer_duration_input_button'),
      onTap: () => _onInputTap(context),
      padding: const EdgeInsets.all(DesignSpec.paddingLg),
      shape: CircleBorder(),
      textStyle: context.theme.textTheme.displaySmall!.copyWith(
        color: AppColors.buttonForeground,
        fontWeight: FontWeight.w900,
      ),
      child: SizedBox.square(
        dimension: DesignSpec.circleSm, 
        child: Center(
          child: Text(
            value.inMinutes.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: AppColors.buttonForeground,
              fontWeight: FontWeight.w900,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
