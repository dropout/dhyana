import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:home/home.dart';

class _MockProfileCubit extends MockCubit<ProfileState> implements ProfileCubit {}

@widgetbook.UseCase(
  name: 'Default',
  type: HomeScreenAppbar,
  path: '[Home]/public/view/',
)
Widget buildHomeScreenAppbar(BuildContext context) {
  final signedIn = context.knobs.boolean(label: 'Signed In', initialValue: true);

  final sessionType = context.knobs.object.dropdown(
    label: 'Session Type',
    options: HomeScreenViewState.values,
    initialOption: HomeScreenViewState.sitting,
  );

  final authCubit = MockAuthStateCubit();
  when(() => authCubit.state).thenReturn(
    signedIn ? const AuthState.signedIn(userId: 'preview-user') : const AuthState.signedOut(),
  );

  final profileCubit = _MockProfileCubit();
  when(() => profileCubit.state).thenReturn(
    ProfileState.loaded(profile: Profile.anonymous()),
  );

  return MultiBlocProvider(
    providers: [
      BlocProvider<AuthStateCubit>.value(value: authCubit),
      BlocProvider<ProfileCubit>.value(value: profileCubit),
    ],
    child: Scaffold(
      appBar: HomeScreenAppbar(
        homeScreenState: HomeScreenState(sessionType: sessionType),
      ),
      body: const SizedBox.shrink(),
    ),
  );
}
