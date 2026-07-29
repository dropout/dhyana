import 'package:bloc_test/bloc_test.dart';
import 'package:dhyana/core/domain/repository/profile_repository.dart';
import 'package:dhyana/modules/profile/domain/service/safe_image_detector.dart';
import 'package:dhyana/modules/profile/domain/usecase/load_profile_use_case.dart';
import 'package:dhyana/modules/profile/domain/usecase/delete_profile_use_case.dart';
import 'package:dhyana/modules/profile/domain/usecase/update_profile_settings_use_case.dart';
import 'package:dhyana/modules/profile/domain/usecase/update_profile_use_case.dart';
import 'package:dhyana/modules/profile/data/service/default_profile_stats_report_updater_service.dart';
import 'package:dhyana/modules/profile/presentation/viewmodel/profile/profile_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class MockProfileCubit extends MockCubit<ProfileState> implements ProfileCubit {}

class MockSafeImageDetectorFactory extends Mock
    implements SafeImageDetectorFactory {}

class MockSafeImageDetector extends Mock implements SafeImageDetector {}

class MockInterpreter extends Mock implements Interpreter {}

class MockProfileStatsUpdater extends Mock
    implements DefaultProfileReportUpdaterService {}

class MockLoadProfileUseCase extends Mock implements LoadProfileUseCase {}

class MockDeleteProfileUseCase extends Mock implements DeleteProfileUseCase {}

class MockUpdateProfileUseCase extends Mock implements UpdateProfileUseCase {}

class MockUpdateProfileSettingsUseCase extends Mock
    implements UpdateProfileSettingsUseCase {}

class MockProfileRepository extends Mock implements ProfileRepository {}
