import 'package:stats/src/presentation/view/profile_stats_view.dart';
import 'package:material_ui/material_ui.dart';

class ProfileStatsScreen extends StatelessWidget {

  final String profileId;

  const ProfileStatsScreen({
    required this.profileId,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      extendBodyBehindAppBar: true,
      body: ProfileStatsView(
        profileId: profileId
      ),
    );
  }

}
