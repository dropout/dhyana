import 'package:material_ui/material_ui.dart';
import 'package:core/core.dart';


class ProfileFooter extends StatelessWidget {

  const ProfileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: Center(child: AppVersionNumber()),
    );
  }

}
