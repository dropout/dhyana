import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';

class DonateButton extends StatefulWidget {

  final VoidCallback? onTap;

  const DonateButton({
    this.onTap,
    super.key,
  });

  @override
  State<DonateButton> createState() => _DonateButtonState();
}

class _DonateButtonState extends State<DonateButton> {

  bool get isEnabled => widget.onTap != null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          color: AppColors.redAccent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: DesignSpec.paddingMd,
            horizontal: DesignSpec.paddingXl,
          ),
          child: AnimatedDefaultTextStyle(
            duration: Durations.short4,
            style: context.theme.textTheme.titleMedium!.copyWith(
              color: isEnabled ? Colors.white : Colors.white.withValues(alpha: 0.5),
              fontWeight: FontWeight.w900,
            ),
            child: Text(context.localizations.donate.toUpperCase()),
          ),
        ),
      ),
    );
  }

}
