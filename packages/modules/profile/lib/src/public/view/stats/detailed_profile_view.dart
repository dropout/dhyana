import 'package:profile/l10n/profile_localizations.dart';
import 'package:profile/profile.dart';
import 'package:profile/src/public/view/stats/label_value_detail.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';

class DetailedProfileView extends StatelessWidget {
  final String profileId;
  final String profileName;
  final DateTime signupDate;
  final ProfileStatsReport profileStatsReport;
  final String? profilePhotoUrl;
  final String? profilePhotoBlurhash;

  const DetailedProfileView({
    required this.profileId,
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
      title: ProfileLocalizations.of(context).profile,
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
                    profileId: profileId,
                    profileName: profileName,
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
            label: ProfileLocalizations.of(context).statsSignedUp,
            value: formatDateTime(context, signupDate),
          ),
          LabelValueDetail(
            label: ProfileLocalizations.of(context).statsFirstSession,
            value: formatDateTime(
              context,
              profileStatsReport.firstSessionDate,
            ),
          ),
          LabelValueDetail(
            label: ProfileLocalizations.of(context).statsLastSession,
            value: formatDateTime(context, profileStatsReport.lastSessionDate),
          ),
        ],
      ),
    );
  }

  String formatDateTime(BuildContext context, DateTime? dateTime) {
    if (dateTime == null) {
      return ProfileLocalizations.of(context).notAvailableAbbr;
    }
    return dateTime.toFormattedDateTimeString(context);
  }
}
