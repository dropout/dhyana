import 'package:home/home.dart';
import 'package:material_ui/material_ui.dart';
import 'package:profile/profile.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:core/core.dart';

@widgetbook.UseCase(
  name: 'Default', 
  type: CustomAppBar, 
  path: '[Core]/presentation/view/'
)
Widget buildCustomAppBar(BuildContext context) {
  final showLeading = context.knobs.boolean(label: 'Show leading', initialValue: true);
  return Scaffold(    
    appBar: CustomAppBar(
      leading: showLeading ? Today(key: ValueKey(DateTime.now().toDayId())) : null,
      trailing: [
        TrailingSlot(child: ProfileButton()),        
      ],
    ),
    body: Center(child: Text('CustomAppBar use case'),)
  );
}
