import 'package:dhyana/core/domain/entity/profile/profile_statistics_report.dart';
import 'package:dhyana/modules/profile/data/service/default_profile_stats_report_updater_service.dart';

class ValidateProfileStatsUseCase {
  final DefaultProfileReportUpdaterService profileStatsReportUpdater;

  ValidateProfileStatsUseCase({
    required this.profileStatsReportUpdater,
  });

  Future<ProfileStatisticsReport> execute(ProfileStatisticsReport statsReport) async {
    return profileStatsReportUpdater.validateStatsReport(statsReport);
  }
}