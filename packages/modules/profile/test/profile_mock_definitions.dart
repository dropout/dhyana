import 'package:auth/auth.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:profile/src/data/datasource/profile_data_provider.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/domain/service/profile_stats_updater_service.dart';
import 'package:profile/src/domain/usecase/load_profile_use_case.dart';
import 'package:profile/src/domain/usecase/delete_profile_use_case.dart';
import 'package:profile/src/domain/usecase/update_profile_settings_use_case.dart';
import 'package:profile/src/domain/usecase/update_profile_use_case.dart';
import 'package:profile/src/presentation/viewmodel/profile_edit_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:profile/src/public/viewmodel/profile_cubit.dart';

class MockAuthNavigator extends Mock implements AuthNavigator;
class MockProfileNavigator extends Mock implements ProfileNavigator;

class MockProfileCubit extends MockCubit<ProfileState>
    implements ProfileCubit {}

class MockProfileEditCubit extends MockCubit<ProfileEditState>
    implements ProfileEditCubit {}

class MockProfileStatsUpdater extends Mock
    implements ProfileStatsReportUpdaterService {}

class MockLoadProfileUseCase extends Mock implements LoadProfileUseCase {}

class MockDeleteProfileUseCase extends Mock implements DeleteProfileUseCase {}

class MockUpdateProfileUseCase extends Mock implements UpdateProfileUseCase {}

class MockUpdateProfileSettingsUseCase extends Mock
    implements UpdateProfileSettingsUseCase {}

class MockProfileRepository extends Mock implements ProfileRepository {}

class MockProfileDataProvider extends Mock implements ProfileDataProvider {}

class MockAuthPublicApi extends Mock implements AuthPublicApi {}
