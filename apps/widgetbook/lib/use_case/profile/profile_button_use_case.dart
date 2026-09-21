import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:core/core.dart';
import 'package:profile/profile.dart';

class _MockProfileCubit extends MockCubit<ProfileState> implements ProfileCubit {}

@widgetbook.UseCase(
	name: 'Default',
	type: ProfileButton,
	path: '[Profile]/public/view/',
)
Widget buildProfileButton(BuildContext context) {
	final signedIn = context.knobs.boolean(label: 'Signed In', initialValue: true);
	final size = context.knobs.int.slider(
		label: 'Size',
		initialValue: 48,
		min: 40,
		max: 160,
	);

	final authCubit = MockAuthStateCubit();
	when(() => authCubit.state).thenReturn(
		signedIn
				? const AuthState.signedIn(userId: 'preview-user')
				: const AuthState.signedOut(),
	);

	final profileCubit = _MockProfileCubit();
	when(() => profileCubit.state).thenReturn(
		ProfileState.loaded(profile: Profile.anonymous()),
	);

	return Center(
		child: MultiBlocProvider(
			providers: [
				BlocProvider<AuthStateCubit>.value(value: authCubit),
				BlocProvider<ProfileCubit>.value(value: profileCubit),
			],
			child: ProfileButton(
        size: size,
        profileImageProvider: AssetImage('assets/images/avatar.jpg'),
      ),
		),
	);
}
