import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_bar/custom_back_button.dart';
import '../util/all.dart';

class ProfileStatsView extends StatefulWidget {
  const ProfileStatsView({super.key});

  @override
  State<ProfileStatsView> createState() => _ProfileStatsViewState();
}

class _ProfileStatsViewState extends State<ProfileStatsView>
    with TickerProviderStateMixin {

  late final TabController primaryTC;
  late final TabController secondaryTC;

  @override
  void initState() {
    primaryTC = TabController(length: 4, vsync: this);
    secondaryTC = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        switch (state) {
          case ProfileLoadingState():
            return buildScaffolding(
              context,
              buildHeaderSlivers(context),
              buildProfileLoading(context),
            );
          case ProfileErrorState():
            return buildScaffolding(
              context,
              buildHeaderSlivers(context),
              buildProfileError(context),
            );
          case ProfileLoadedState():
            return buildScaffolding(
              context,
              buildHeaderSliversLoaded(context, state.profile),
              buildProfileLoaded(context, state.profile)
            );
          default:
            return const SizedBox.shrink();
        }
      }
    );
  }

  List<Widget> buildProfileLoading(BuildContext context) {
    return [
      const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    ];
  }

  List<Widget> buildProfileError(BuildContext context) {
    return [
      Expanded(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)
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
        )
      ),
    ];
  }

  List<Widget> buildProfileLoaded(BuildContext context, Profile profile) {
    return [
      TabBar(
        // controller: primaryTC,
        // labelColor: Colors.white,
        // unselectedLabelColor: Colors.white70,
        // indicatorColor: AppColors.backgroundPaper,
        controller: primaryTC,
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 2.0,
        isScrollable: false,
        unselectedLabelColor: Colors.grey,
        tabs: [
          Tab(text: AppLocalizations.of(context).days),
          Tab(text: AppLocalizations.of(context).weeks),
          Tab(text: AppLocalizations.of(context).months),
          Tab(text: AppLocalizations.of(context).years),
        ],
      ),
      Expanded(
        child: TabBarView(
          controller: primaryTC,
          children: [
            buildTabBarViewItem(
              context,
              'days',
              DaysStatsView(
                profile: profile,
              ),
            ),

            buildTabBarViewItem(
              context,
              'weeks',
              WeeksStatsView(
                profile: profile,
              ),
            ),

            buildTabBarViewItem(
              context,
              'months',
              MonthsStatsView(
                // profile: profile,
              ),
            ),

            buildTabBarViewItem(
              context,
              'years',
              YearsStatsView(
                // profile: profile,
              ),
            ),


          ],
        ),
      ),
    ];
  }

  Widget buildScaffolding(
    BuildContext context,
    List<Widget> headerSlivers,
    List<Widget> children,
  ) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double pinnedHeaderHeight = statusBarHeight + kToolbarHeight;
    return ExtendedNestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return headerSlivers;
      },
      pinnedHeaderSliverHeightBuilder: () => pinnedHeaderHeight,
      onlyOneScrollInBody: true,
      body: Column(
        children: children,
      ),
    );
  }

  List<Widget> buildHeaderSlivers(BuildContext context) {
    return [
      buildAppBar(context),
    ];
  }

  List<Widget> buildHeaderSliversLoaded(BuildContext context, Profile profile) {
    return [
      buildAppBar(context),
      buildProfileDetails(context, profile),
    ];
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

  Widget buildProfileDetails(BuildContext context, Profile profile) {
    return SliverToBoxAdapter(
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
    );
  }

  Widget buildTabBarViewItem(BuildContext context, String id, Widget child) {
    return ExtendedVisibilityDetector(
      uniqueKey: Key(id),
      child: SingleChildScrollView(
        key: PageStorageKey<String>(id),
        physics: const ClampingScrollPhysics(),
        child: child,
      ),
    );
  }
}
