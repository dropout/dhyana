import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:chanting/chanting.dart';
import 'package:chanting/src/public/view/chanting_settings/chant_card.dart';
import 'package:core/core.dart';

@widgetbook.UseCase(
	name: 'Default',
	type: ChantCard,
	path: '[Chanting]/public/view/chanting_settings/',
)
Widget buildChantCard(BuildContext context) {
	final name = context.knobs.string(
		label: 'Name',
		initialValue: 'Thousand Eyes and Hands Sutra',
	);
	final durationSeconds = context.knobs.int.slider(
		label: 'Duration (seconds)',
		initialValue: 225,
		min: 1,
		max: 900,
	);
	final showTrailing = context.knobs.boolean(
		label: 'Show Trailing',
		initialValue: true,
	);

	return Center(
		child: Padding(
			padding: const EdgeInsets.all(DesignSpec.paddingLg),
			child: ConstrainedBox(
				constraints: const BoxConstraints(maxWidth: 360),
				child: ChantCard(
          chantImageProvider: AssetImage('assets/images/tree.jpg'),
					index: 0,
					chantViewModel: ChantPlaylistItem(
						id: 'preview-playlist-item',
						chantId: 'preview-chant',
						name: name,
						blurHash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
						order: 0,
						duration: Duration(seconds: durationSeconds),
					),
					trailing: showTrailing
							? SizedBox.square(
								dimension: 48,
								child: Center(child: const Icon(Icons.drag_handle_rounded)),
							)
							: null,
				),
			),
		),
	);
}
