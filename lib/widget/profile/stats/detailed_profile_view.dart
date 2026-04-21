import 'package:dhyana/model/profile.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/profile/profile_image.dart';
import 'package:dhyana/widget/profile/stats/label_value_detail.dart';
import 'package:dhyana/widget/util/app_card.dart';
import 'package:dhyana/widget/util/app_context.dart';
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
        title: context.l10n.profile,
        padding: const EdgeInsets.only(
          bottom: DesignSpec.paddingLg,
          left: DesignSpec.paddingLg,
          right: DesignSpec.paddingLg,
        ),
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
                    padding: const EdgeInsets.all(DesignSpec.paddingXs),
                    child: ProfileImage(profile: profile, size: 48),
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
              label: context.l10n.statsSignedUp,
              value: formatDateTime(
                context,
                profile.signupDate,
              ),
            ),
            LabelValueDetail(
              label: context.l10n.statsFirstSession,
              value: formatDateTime(
                context,
                profile.statsReport.firstSessionDate
              ),
            ),
            LabelValueDetail(
              label: context.l10n.statsLastSession,
              value: formatDateTime(
                context,
                profile.statsReport.lastSessionDate
              ),
            ),
          ],
        )
    );
  }

  String formatDateTime(BuildContext context, DateTime? dateTime) {
    if (dateTime == null) {
      return context.l10n.notAvailableAbbr;
    }
    return dateTime.toFormattedDateTimeString(context);
  }

}
