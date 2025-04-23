import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/util/all.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/profile_avatar.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/profile/stats/label_value_detail.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

class DetailedProfileView extends StatelessWidget {

  final Profile profile;

  const DetailedProfileView({
    required this.profile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
        title: AppLocalizations.of(context).profile,
        padding: EdgeInsets.only(
          bottom: AppThemeData.paddingLg,
          left: AppThemeData.paddingLg,
          right: AppThemeData.paddingLg,
        ),
        child: Padding(
          // padding: const EdgeInsets.all(AppThemeData.paddingLg),
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppThemeData.paddingXs),
                      child: ProfileImage.fromProfile(profile, size: 48),
                    ),
                  ),
                  Gap.medium(),
                  Text(
                    profile.displayName,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Gap.medium(),
              LabelValueDetail(
                label: 'Signed up',
                value: profile.signupDate.toFormattedDateString(context),
              ),
            ],
          ),
        )
    );
  }
}


