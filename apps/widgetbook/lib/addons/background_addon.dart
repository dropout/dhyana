import 'package:material_ui/material_ui.dart';
import 'package:widgetbook/widgetbook.dart';

class BackgroundAddon extends WidgetbookAddon<Color> {
  BackgroundAddon({this.initialColor = Colors.white})
      : super(name: 'Background');

  final Color initialColor;

  @override
  List<Field<Color>> get fields => [
        ColorField(name: 'color', initialValue: initialColor),
      ];

  @override
  Color valueFromQueryGroup(Map<String, String> group) =>
      valueOf<Color>('color', group)!;

  @override
  Widget buildUseCase(BuildContext context, Widget child, Color setting) {
    return ColoredBox(color: setting, child: child);
  }
}