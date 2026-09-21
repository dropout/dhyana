import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:profile/profile.dart';

@widgetbook.UseCase(
	name: 'Default',
	type: ProfileAvatar,
	path: '[Profile]/public/view/',
)
Widget buildProfileAvatar(BuildContext context) {
	final name = context.knobs.string(
		label: 'Name',
		initialValue: 'Ada Lovelace',
	);
	final imageSize = context.knobs.double.slider(
		label: 'Image Size',
		initialValue: 128,
		min: 48,
		max: 256,
	);

	return Center(
		child: ProfileAvatar(
			profileId: 'preview-profile',
			profileName: name,
			imageSize: imageSize,
		),
	);
}
