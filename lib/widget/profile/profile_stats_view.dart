import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_bar/custom_back_button.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileStatsView extends StatefulWidget {
  const ProfileStatsView({super.key});

  @override
  State<ProfileStatsView> createState() => _ProfileStatsViewState();
}

class _ProfileStatsViewState extends State<ProfileStatsView>
  with SingleTickerProviderStateMixin {

  late final TabController _tabController;

  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch (state) {
          case ProfileLoadingState():
            return buildScaffolding(context, buildProfileLoading(context));
          case ProfileErrorState():
            return buildScaffolding(context, buildProfileError(context));
          case ProfileLoadedState():
            return buildScaffolding(context, buildProfileLoaded(context, state.profile));
          default:
            return const SizedBox.shrink();
        }
      }
    );
  }

  List<Widget> buildProfileLoading(BuildContext context) {
    return [
      const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
    ];
  }

  List<Widget> buildProfileError(BuildContext context) {
    return [
      SliverFillRemaining(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppThemeData.spacingMd),
            child: Container(
                padding: const EdgeInsets.all(AppThemeData.spacingSm),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                      Radius.circular(AppThemeData.borderRadiusMd)
                  ),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.warning_amber_rounded,
                        size: 64,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Unable to load profile',
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: Colors.white,
                                )
                            ),
                            Text(
                                'An unexpected error occured '
                                    'while trying to load your profile.',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                )
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
            ),
          )
        ),
      )
    ];

  }

  List<Widget> buildProfileLoaded(BuildContext context, Profile profile) {
    return [

      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(AppThemeData.spacingMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: AppThemeData.spacingLg),
              Gap.large(),
              ConsecutiveDaysDisplay(
                profile: profile,
              ),
              Gap.large(),
              Padding(
                padding: const EdgeInsets.all(AppThemeData.spacingMd),
                child: ProfileMetricsView(profile: profile),
              ),
              Gap.large(),
            ],
          ),
        ),
      ),

      SliverPersistentHeader(
        pinned: true,
        delegate: _SliverAppBarDelegate(
          TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,

            // labelPadding: EdgeInsets.symmetric(horizontal: AppThemeData.spacingXs),
            // indicator: const BoxDecoration(
            //   border: Border(
            //     bottom: BorderSide(
            //       color: Colors.white,
            //       width: 2.0,
            //     ),
            //   ),
            // ),
            tabs: [
              Tab(text: AppLocalizations.of(context).days),
              Tab(text: AppLocalizations.of(context).months),
              Tab(text: AppLocalizations.of(context).years),
              Tab(text: AppLocalizations.of(context).milestones),
            ],
          ),
        ),
      ),

      SliverFillRemaining(
        child: SizedBox.expand(
          child: TabBarView(
            controller: _tabController,
            children: [

              Padding(
                padding: const EdgeInsets.all(AppThemeData.spacingMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppLocalizations.of(context).days, style: Theme.of(context).textTheme.titleLarge),
                    DailyChart(profile: profile)
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(AppThemeData.spacingMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppLocalizations.of(context).months, style: Theme.of(context).textTheme.titleLarge),
                    DailyChart(profile: profile)
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(AppThemeData.spacingMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppLocalizations.of(context).years, style: Theme.of(context).textTheme.titleLarge),
                    DailyChart(profile: profile)
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(AppThemeData.spacingMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppLocalizations.of(context).milestones, style: Theme.of(context).textTheme.titleLarge),
                    DailyChart(profile: profile)
                  ],
                ),
              ),

            ]
          ),
        ),
      ),

    ];
  }

  Widget buildScaffolding(BuildContext context, List<Widget> content) {
    return CustomScrollView(
      slivers: [
        buildAppBar(context),
        ...content,
      ]
    );
  }

  Widget buildAppBar(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      elevation: 0,
      stretch: true,
      floating: false,
      pinned: true,
      leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomBackButton()
      ),
      title: Text(
        AppLocalizations.of(context).profileStats,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;
  // double get maxExtent => 500;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.black,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
