import 'package:material_ui/material_ui.dart';

class AppCircularProgressIndicator extends StatelessWidget {

  final Color color;

  const AppCircularProgressIndicator({
    this.color = Colors.black,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
    );
  }
}
