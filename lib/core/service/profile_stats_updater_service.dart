import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/entity/profile/update_profile_stats_result.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session.dart';
import 'package:dhyana/modules/profile/domain/entity/profile_statistics_report.dart';

abstract interface class ProfileStatsUpdaterService {
  UpdateProfileStatsResult updateProfileStatsWithSession(Profile profile, Session session);
  ProfileStatisticsReport validateStatsReport(ProfileStatisticsReport report);  
}
