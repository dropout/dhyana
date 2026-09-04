import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:session/src/domain/entity/session_completed_data_entity.dart';
import 'package:session/src/domain/service/session_app_port.dart';
import 'package:social/social.dart';
import 'package:stats/stats.dart';

import 'package:session/src/domain/usecase/log_session_insights_use_case.dart';
import 'package:session/src/domain/usecase/update_profile_with_session_use_case.dart';
import 'package:session/src/presentation/viewmodel/session_completed/session_completed_cubit.dart';


class MockStatsPublicApi 
  extends Mock 
  implements StatsPublicApi {}

class MockProfilePublicApi 
  extends Mock 
  implements ProfilePublicApi {}

class MockPresenceCubit
  extends MockCubit<PresenceState>
  implements PresenceCubit {}

class MockLogSessionUseCase
  extends Mock
  implements LogSessionInsightsUseCase {}

class MockUpdateProfileWithSessionUseCase
  extends Mock
  implements UpdateProfileWithSessionUseCase {}

class MockMindfulMinutesService 
  extends Mock 
  implements MindfulMinutesService {}

class MockSessionCompletedCubit
  extends MockCubit<SessionCompletedDataEntity>
  implements SessionCompletedCubit {}

class MockSessionAppPort 
  extends Mock
  implements SessionAppPort {}
  
class MockProfileCubit
  extends MockCubit<ProfileState>
  implements ProfileCubit {}

class MockHomeNavigator
  extends Mock
  implements HomeNavigator {}