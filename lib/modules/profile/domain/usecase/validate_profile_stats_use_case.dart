import 'package:dhyana/modules/insights/domain/entity/profile_statistics_report.dart';
import 'package:dhyana/modules/profile/presentation/viewmodel/profile/data_update/profile_stats_report_updater.dart';

class ValidateProfileStatsUseCase {
  final ProfileStatsReportUpdater profileStatsReportUpdater;

  ValidateProfileStatsUseCase({
    required this.profileStatsReportUpdater,
  });

  Future<ProfileStatisticsReport> execute(ProfileStatisticsReport statsReport) async {
    return profileStatsReportUpdater.validateStatsReport(statsReport);
  }
}