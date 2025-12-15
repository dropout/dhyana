import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';

class AmountSelector extends StatefulWidget {

  final Function(double)? onChange;
  final AmountSelectorController? controller;

  const AmountSelector({
    this.onChange,
    this.controller,
    super.key
  });

  @override
  State<AmountSelector> createState() => _AmountSelectorState();
}

class _AmountSelectorState
  extends State<AmountSelector>
  implements AmountSelectorControllerDelegate {

  final availableAmounts = [5.0, 10.0, 25.0, 50.0, 100.0, 200.0];
  double selectedAmount = 0.0;

  bool get hasSelectedAmount => selectedAmount > 0.0;

  @override
  void initState() {
    widget.controller?.attachDelegate(this);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: DesignSpec.spacingMd,
          runSpacing: DesignSpec.spacingMd,
          children: availableAmounts.map((amount) => AmountSelectorItem(
            text: '\$${amount.toStringAsFixed(0)}',
            isSelected: selectedAmount == amount,
            onTap: () {
              if (selectedAmount == amount) {
                amount = 0.0; // Deselect if tapped again
              }
              setState(() {
                selectedAmount = amount;
              });
              widget.onChange?.call(amount);
            },
          )).toList(),
        ),
      ],
    );
  }

  @override
  void clearSelection() {
    setState(() {
      selectedAmount = 0.0;
    });
    widget.onChange?.call(0.0);
  }
}

class AmountSelectorItem extends StatelessWidget {

  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const AmountSelectorItem({
    required this.text,
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  void _tapped(BuildContext context) {
    if (onTap != null) {
      onTap!.call();
      context.hapticsTap();
    }
  }

  @override
  Widget build(BuildContext context) {

    final bColor = isSelected ? AppColors.redAccent : Colors.black;
    final fColor = Colors.white;

    return GestureDetector(
      onTap: () => _tapped(context),
      child: AnimatedContainer(
        duration: Durations.short4,
        constraints: BoxConstraints(
          minWidth: 96,
        ),
        padding: EdgeInsets.symmetric(
          vertical: DesignSpec.paddingMd,
          horizontal: DesignSpec.paddingLg,
        ),
        decoration: BoxDecoration(
          color: bColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleMedium!.copyWith(
            color: fColor,
            fontWeight: FontWeight.w900,
          ),
        )
      ),
    );
  }

}

abstract interface class AmountSelectorControllerDelegate {
  void clearSelection();
}

class AmountSelectorController {

  AmountSelectorControllerDelegate? _delegate;
  
  void attachDelegate(AmountSelectorControllerDelegate delegate) {
    _delegate = delegate;
  }

  void clearSelection() {
    _delegate?.clearSelection();
  }
  
  void dispose() {
    _delegate = null;
  }

}
