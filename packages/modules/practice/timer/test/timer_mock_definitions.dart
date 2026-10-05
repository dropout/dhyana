import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:core/core.dart';
import 'package:auth/auth.dart';
import 'package:timer/src/domain/entity/timer_state_entity.dart';
import 'package:timer/src/domain/repository/timer_settings_history_repository.dart';
import 'package:timer/src/domain/service/timer_app_port.dart';
import 'package:timer/src/domain/usecase/playback_state_change_use_case.dart';
import 'package:timer/src/domain/service/timer_audio_service.dart';
import 'package:timer/src/domain/usecase/complete_timer_use_case.dart';
import 'package:timer/src/domain/usecase/configure_event_scheduler_use_case.dart';
import 'package:timer/src/domain/usecase/start_timer_use_case.dart';
import 'package:timer/src/presentation/viewmodel/timer_cubit.dart';
import 'package:timer/src/public/viewmodel/timer_settings_cubit.dart';


class MockAuthPublicApi 
  extends Mock 
  implements AuthPublicApi {}

class MockTimerCubit 
  extends MockCubit<TimerStateEntity> 
  implements TimerCubit {}

class MockTimerSettingsCubit 
  extends Mock 
  implements TimerSettingsCubit {}

class MockConfigureEventSchedulerUseCase 
  extends Mock 
  implements ConfigureEventSchedulerUseCase {}

class MockStartTimerUseCase 
  extends Mock 
  implements StartTimerUseCase {}

class MockPlaybackStateChangeUseCase 
  extends Mock 
  implements PlaybackStateChangeUseCase {}

class MockCompleteTimerUseCase 
  extends Mock 
  implements CompleteTimerUseCase {}

class MockTimerAudioService 
  extends Mock 
  implements TimerAudioService {}

class MockTimerEventScheduler 
  extends Mock 
  implements TimerEventScheduler {}

class MockTimerSettingsHistoryRepository
  extends Mock
  implements TimerSettingsHistoryRepository {}

class MockTimerAppPort 
  extends Mock
  implements TimerAppPort {}
  
class MockSessionNavigator
  extends Mock
  implements SessionNavigator {}