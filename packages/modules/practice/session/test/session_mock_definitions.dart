import 'package:mocktail/mocktail.dart';
import 'package:profile/profile.dart';

import 'package:session/src/domain/usecase/log_session_insights_use_case.dart';
import 'package:session/src/domain/usecase/update_profile_with_session_use_case.dart';

class MockProfilePublicApi 
  extends Mock 
  implements ProfilePublicApi {}

class MockLogSessionUseCase
  extends Mock
  implements LogSessionInsightsUseCase {}

class MockUpdateProfileWithSessionUseCase
  extends Mock
  implements UpdateProfileWithSessionUseCase {}
