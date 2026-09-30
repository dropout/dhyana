import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/profile.dart';
import 'package:stats/l10n/stats_localizations.dart';
import 'package:stats/src/presentation/view/profile_stats_view.dart';
import 'package:material_ui/material_ui.dart';

class ProfileStatsScreen extends StatelessWidget {
  final String profileId;

  const ProfileStatsScreen({required this.profileId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) => switch(state) {
        ProfileLoadingState() => DefaultScreenSetup.loading(
          title: StatsLocalizations.of(context).profileStats,
        ),
        ProfileErrorState() => DefaultScreenSetup.error(
          title: StatsLocalizations.of(context).profileStats,
        ),
        ProfileLoadedState() => ProfileStatsView(
          profile: state.profile,
        ),
        _ => SizedBox.shrink(),
      },
    );
  }




}
