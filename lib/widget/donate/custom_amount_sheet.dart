import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/donate/donate_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAmountSheet extends StatefulWidget {

  final Function(double)? onAmountSelected;

  const CustomAmountSheet({
    this.onAmountSelected,
    super.key,
  });

  @override
  State<CustomAmountSheet> createState() => _CustomAmountSheetState();
}

class _CustomAmountSheetState extends State<CustomAmountSheet> {
  
  double selectedAmount = 0.0;
  TextEditingController textController = TextEditingController();

  bool get hasSelectedAmount => selectedAmount > 0.0;

  @override
  void initState() {
    super.initState();
  }

  void handleTextFieldChange(BuildContext context, String value) {
    double amount = value.isNotEmpty ? double.parse(value) : 0.0;
    setState(() {
      selectedAmount = amount;
    });
  }

  void _onDonateButtonTap() {
    widget.onAmountSelected?.call(selectedAmount);
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            Gap.large(),
            Text('Donate Custom Amount',
              style: context.theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              )
            ),
            Gap.medium(),
            IntrinsicWidth(
              child: SizedBox(
                height: 64,
                child: TextField(
                  autofocus: true,
                  controller: textController,
                  expands: true,
                  maxLines: null,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    // border: InputBorder.none,
                    prefix: Text('\$ '),
                  ),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (value) => handleTextFieldChange(context, value),
                  // onChanged: (value) => debouncer(() => searchCities(context, value)),
                ),
              ),
            ),
          ]
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: DesignSpec.padding2Xl),
              child: DonateButton(
                onTap: hasSelectedAmount ? _onDonateButtonTap : null,
              )
            )
          )
        )
      ],
    );
  }

}
