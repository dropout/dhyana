// import 'package:dhyana/core/domain/entity/session.dart';
// import 'package:dhyana/util/logger_mixin.dart';
// import 'package:dhyana/core/domain/repository/profile_repository.dart';
// import 'package:dhyana/core/domain/repository/statistics_repository.dart';
// import 'package:dhyana/core/domain/service/mindful_minutes_service.dart';
// import 'package:dhyana/modules/practice/session/domain/usecase/log_session_statistics_use_case.dart';
// import 'package:dhyana/modules/practice/session/domain/usecase/update_profile_with_session_use_case.dart';

// class CompleteSessionUseCase with LoggerMixin {

//   final UpdateProfileWithSessionUseCase saveSessionToProfileUseCase;
//   final LogSessionStatisticsUseCase logSessionUseCase;

//   CompleteSessionUseCase({
//     required ProfileRepository profileRepository,
//     required StatisticsRepository statisticsRepository,
//     required MindfulMinutesService mindfulMinutesService,
//   }) : saveSessionToProfileUseCase = UpdateProfileWithSessionUseCase(
//          profileRepository: profileRepository,
//        ),
//        logSessionUseCase = LogSessionStatisticsUseCase(
//          statisticsRepository: statisticsRepository,
//          mindfulMinutesService: mindfulMinutesService,
//        );

//   Future<void> execute(String profileId, Session session) async {
//     final updatedProfile =
//         await saveSessionToProfileUseCase.execute(profileId, session);
//     await logSessionUseCase.execute(updatedProfile, session);
//   }

// }
