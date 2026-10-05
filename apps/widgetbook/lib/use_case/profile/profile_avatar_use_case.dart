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
		initialValue: 'Layman Pang',
	);
	final imageSize = context.knobs.double.slider(
		label: 'Image Size',
		initialValue: 128,
		min: 48,
		max: 256,
	);

  final hasProfileImage = context.knobs.boolean(
    label: 'Has Profile Image',
    initialValue: true,
  );

	return Center(
		child: ProfileAvatar(
			profileId: 'preview-profile',
			profileName: name,
			imageSize: imageSize,
      profilePhotoBlurhash: hasProfileImage ? 'LEHV6nWB2yk8pyo0adR*.7kCMdnj' : null,
			profileImageProvider: hasProfileImage ? AssetImage('assets/images/avatar.jpg') : null,
		),
	);
}
