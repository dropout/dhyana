import 'package:material_ui/material_ui.dart';
import 'package:core/core.dart';


class InputButton extends StatelessWidget {

  final void Function() onTap;
  final EdgeInsets padding;
  final Widget? child;
  final ShapeBorder shape;
  final TextStyle? textStyle;

  const InputButton({
    required this.onTap,
    this.shape = const StadiumBorder(),
    this.padding = const EdgeInsets.symmetric(
      horizontal: DesignSpec.spacingMd,
      vertical: DesignSpec.spacingSm,
    ),
    this.child,
    this.textStyle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: padding,
      onPressed: onTap,
      elevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      constraints: const BoxConstraints(), // removes unnecessary padding
      shape: shape,
      // fillColor: Colors.black, // background color
      fillColor: AppColors.buttonBackground, // background color
      splashColor: AppColors.splashColor,
      clipBehavior: Clip.none,
      child: DefaultTextStyle(
        style: textStyle ?? Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.buttonForeground,
          fontWeight: FontWeight.w800,
        ),
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
