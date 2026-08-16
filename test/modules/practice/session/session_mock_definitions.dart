import 'package:mocktail/mocktail.dart';

import 'package:dhyana/modules/practice/session/domain/usecase/log_session_insights_use_case.dart';
import 'package:dhyana/modules/practice/session/domain/usecase/update_profile_with_session_use_case.dart';


class MockLogSessionUseCase
  extends Mock
  implements LogSessionInsightsUseCase {}

class MockUpdateProfileWithSessionUseCase
  extends Mock
  implements UpdateProfileWithSessionUseCase {}
