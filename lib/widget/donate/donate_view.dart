import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/donate/amount_selector.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

class DonateView extends StatefulWidget {
  const DonateView({super.key});

  @override
  State<DonateView> createState() => _DonateViewState();
}

class _DonateViewState extends State<DonateView> {

  double? selectedAmount;

  bool get hasSelectedAmount => selectedAmount != null;

  void onDonatePressed() {
    // Handle donation logic here
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: DesignSpec.paddingXl
          ),
          child: Column(
            children: [
              Gap.xl(),
              Text('Do you like using Dhyana?',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              Gap.small(),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed lorem vel turpis sollicitudin tempus non id ante.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              Gap.small(),
              Text('Fusce sed porta est, at bibendum dolor.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),Gap.small(),
              Gap.large(),
              AmountSelector(),
            ],
          ),
        )
      ),
    );
  }

}
