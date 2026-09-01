import 'package:profile/src/domain/entity/profile_stats_report_entity.dart';
import 'package:profile/src/domain/service/profile_stats_updater_service.dart';

class ValidateProfileStatsUseCase {
  final ProfileStatsReportUpdaterService profileStatsReportUpdater;

  ValidateProfileStatsUseCase({
    required this.profileStatsReportUpdater,
  });

  Future<ProfileStatsReportEntity> execute(ProfileStatsReportEntity statsReport) async {
    return profileStatsReportUpdater.validateStatsReport(statsReport);
  }
}
