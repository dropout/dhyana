import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/core/domain/entity/profile/profile_statistics_report.dart';

abstract interface class ProfileStatsUpdaterService {
  Profile updateProfileStatsWithSession(Profile profile, Session session);
  ProfileStatisticsReport validateStatsReport(ProfileStatisticsReport report);  
}
