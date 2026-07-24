import 'package:dhyana/modules/insights/domain/model/profile_statistics_report.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/core/presentation/widget/profile/profile_image.dart';
import 'package:dhyana/modules/insights/presentation/widget/stats/label_value_detail.dart';
import 'package:dhyana/core/presentation/widget/util/app_card.dart';
import 'package:dhyana/core/presentation/widget/util/app_context.dart';
import 'package:dhyana/core/presentation/widget/util/gap.dart';
import 'package:flutter/material.dart';

class DetailedProfileView extends StatelessWidget {
  final String profileName;
  final DateTime signupDate;
  final ProfileStatisticsReport profileStatsReport;
  final String? profilePhotoUrl;
  final String? profilePhotoBlurhash;

  const DetailedProfileView({
    required this.profileName,
    required this.signupDate,
    required this.profileStatsReport,
    this.profilePhotoUrl,
    this.profilePhotoBlurhash,
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
                  child: ProfileImage(
                    profileName: profileName,
                    profileImagePath: profilePhotoUrl,
                    profilePhotoBlurhash: profilePhotoBlurhash,
                    size: 48
                  ),
                ),
              ),
              Gap.medium(),
              Text(
                profileName,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Gap.medium(),
          LabelValueDetail(
            label: context.l10n.statsSignedUp,
            value: formatDateTime(context, signupDate),
          ),
          LabelValueDetail(
            label: context.l10n.statsFirstSession,
            value: formatDateTime(
              context,
              profileStatsReport.firstSessionDate,
            ),
          ),
          LabelValueDetail(
            label: context.l10n.statsLastSession,
            value: formatDateTime(context, profileStatsReport.lastSessionDate),
          ),
        ],
      ),
    );
  }

  String formatDateTime(BuildContext context, DateTime? dateTime) {
    if (dateTime == null) {
      return context.l10n.notAvailableAbbr;
    }
    return dateTime.toFormattedDateTimeString(context);
  }
}
