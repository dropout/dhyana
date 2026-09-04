import 'package:bloc_test/bloc_test.dart';
import 'package:core/src/service/safe_image_detector.dart';
import 'package:core/src/service/shader_service.dart';
import 'package:core/src/service/shared_preferences_service.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:core/src/domain/repository/storage_repository.dart';
import 'package:core/src/presentation/viewmodel/auth_state_cubit.dart';
import 'package:core/src/service/analytics_service.dart';
import 'package:core/src/service/crashlytics_service.dart';
import 'package:core/src/service/haptics_service.dart';
import 'package:core/src/service/id_generator_service.dart';
import 'package:core/src/service/overlay_service.dart';
import 'package:core/src/service/resource_resolver.dart';
import 'package:core/src/service/wakelock_service.dart';
import 'package:core/src/util/launch_url.dart';
import 'package:core/src/util/services.dart';


class MockServices extends Mock implements Services {}
class MockHapticsService extends Mock implements HapticsService {}
class MockIdGeneratorService extends Mock implements IdGeneratorService {}
class MockOverlayService extends Mock implements OverlayService {}
class MockWakelockService extends Mock implements WakelockService {}
class MockUrlLauncher extends Mock implements UrlLauncher {}

class MockGoRouter extends Mock implements GoRouter {}

class MockStorageRepository extends Mock implements StorageRepository {}
class MockResourceResolver extends Mock implements ResourceResolver {}
class MockCrashlyticsService extends Mock implements CrashlyticsService {}
class MockAnalyticsService extends Mock implements AnalyticsService {}


class MockAuthStateCubit extends MockCubit<AuthState> implements AuthStateCubit {}

class MockSafeImageDetectorFactory extends Mock implements SafeImageDetectorFactory {}
class MockSafeImageDetector extends Mock implements SafeImageDetector {}

class MockSharedPreferencesService 
  extends Mock 
  implements SharedPreferencesService {}

class MockHydratedStorage 
  extends Mock 
  implements HydratedStorage {}

class MockShaderService
  extends Mock
  implements ShaderService {}