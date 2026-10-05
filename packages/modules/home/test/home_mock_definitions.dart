import 'package:bloc_test/bloc_test.dart';

import 'package:chanting/chanting.dart';
import 'package:profile/profile.dart';
import 'package:timer/timer.dart';

class MockTimerSettingsCubit extends MockCubit<TimerSettingsState> implements TimerSettingsCubit {}
class MockChantingSettingsCubit extends MockCubit<ChantingSettingsState> implements ChantingSettingsCubit {}
class MockProfileCubit extends MockCubit<ProfileState> implements ProfileCubit {}

