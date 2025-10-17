import 'package:dhyana/widget/app_bar/all.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/util/app_button.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

import 'default_screen_setup.dart';

class DonateScreen extends StatelessWidget {

  const DonateScreen({super.key});

  void _onDonateButtonTapped(BuildContext context) {
    // Implement donation logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: const CustomBackButton(),
      ),

      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppThemeData.paddingXl
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
                    buildSelector(context),

                  ],
                ),
              )
            ),
          ),

          buildBottomArea(context),
        ],
      ),
    );
  }

  Widget buildSelector(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppButton(
                onTap: () {},
                text: '\$5',
              ),
            ),
            Gap.medium(),
            Expanded(
              child: AppButton(
                onTap: () {},
                text: '\$10',
              ),
            ),
            Gap.medium(),
            Expanded(
              child: AppButton(
                onTap: () {},
                text: '\$25',
              ),
            ),
          ],
        ),
        Gap.medium(),
        Row(
          children: [
            Expanded(
              child: AppButton(
                onTap: () {},
                text: '\$50',
              ),
            ),
            Gap.medium(),
            Expanded(
              child: AppButton(
                onTap: () {},
                text: '\$100',
              ),
            ),
            Gap.medium(),
            Expanded(
              child: AppButton(
                onTap: () {},
                text: '\$200',
              ),
            ),
          ],
        ),
      ],
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
            child: AppButton(
              key: const Key('donate_screen_donate_button'),
              onTap: () => _onDonateButtonTapped(context),
              text: context.localizations.donate.toUpperCase(),
              buttonSize: AppButtonSize.large,
              bColor: AppColors.redAccent,
              // bColor: Colors.white,
              // fColor: Colors.black,
            )
          ),
        ],
      ),
    );
  }

}
