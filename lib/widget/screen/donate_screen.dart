import 'package:dhyana/widget/app_bar/all.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/donate/amount_selector.dart';
import 'package:dhyana/widget/donate/custom_amount_sheet.dart';
import 'package:dhyana/widget/donate/donate_button.dart';
import 'package:dhyana/widget/util/app_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DonateScreen extends StatefulWidget {

  const DonateScreen({super.key});

  @override
  State<DonateScreen> createState() => _DonateScreenState();

}

class _DonateScreenState extends State<DonateScreen> {

  late final AmountSelectorController amountSelectorController
   = AmountSelectorController();
  double selectedAmount = 0.0;
  bool get hasSelectedAmount => (selectedAmount > 0.0);

  void _onAmountChange(double amount) {
    setState(() {
      selectedAmount = amount;
    });
  }

  void _triggerCustomAmountSheet(BuildContext context) {
    // deselect any previously selected amount
    amountSelectorController.clearSelection();

    // show the custom amount input sheet
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      useSafeArea: true,
      backgroundColor: AppColors.backgroundPaper,
      showDragHandle: false,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: CustomAmountSheet(
          onAmountSelected: (customAmount) => _onCustomAmountSelected(context, customAmount),
        )
      ),
    );
  }

  void _onCustomAmountSelected(BuildContext context, double customAmount) {
    context.pop(); // close the custom amount sheet
    _startPaymentProcess(context, customAmount);
  }

  void _startPaymentProcess(BuildContext context, double amount) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      backgroundColor: AppColors.backgroundPaper,
      showDragHandle: false,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(DesignSpec.paddingLg),
                    child: Text(
                      'Payment processing is not implemented in this demo.\n Show payment sheet for \$${amount.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              AppButton(
                // text: 'Close'.toUpperCase(),
                text: context.localizations.close.toUpperCase(),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: const CustomBackButton(),
      ),
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          buildContentArea(context),
          buildBottomArea(context),
        ],
      ),
    );
  }

  Widget buildContentArea(BuildContext context) {
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
              AmountSelector(
                controller: amountSelectorController,
                onChange: _onAmountChange,
              ),
              Gap.large(),
              AppButton(
                text: 'Custom amount'.toUpperCase(),
                onTap: () => _triggerCustomAmountSheet(context),
              )
            ],
          ),
        )
      ),
    );
  }

  Widget buildBottomArea(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          // can grab scrollable area underneath
          IgnorePointer(
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.8],
                  colors: [
                    AppColors.backgroundPaper.withValues(alpha: 0.0),
                    AppColors.backgroundPaper,
                  ]
                )
              )
            ),
          ),
          SafeArea(
            top: false,
            child: DonateButton(
              key: const Key('donate_screen_donate_button'),
              onTap: hasSelectedAmount ? () => _startPaymentProcess(context, selectedAmount) : null,
            )
          ),
        ],
      ),
    );
  }

}

