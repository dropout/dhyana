import 'package:dhyana/modules/practice/timer/domain/usecase/playback_state_change_use_case.dart';
import 'package:dhyana/modules/practice/timer/domain/service/timer_audio_service.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/complete_timer_use_case.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/configure_event_scheduler_use_case.dart';
import 'package:dhyana/modules/practice/timer/domain/usecase/start_timer_use_case.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer_cubit.dart';
import 'package:mocktail/mocktail.dart';


class MockTimerCubit 
  extends Mock 
  implements TimerCubit {}


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