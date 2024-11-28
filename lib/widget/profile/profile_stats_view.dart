import 'dart:ui' as ui;

import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_bar/all.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/title_effect.dart';
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
    with TickerProviderStateMixin, TitleEffectMixin {

  late final TabController primaryTC;
  late final ScrollController scrollController;

  late final void Function() _listener;

  @override
  void initState() {
    primaryTC = TabController(length: 4, vsync: this);
    scrollController = ScrollController();
    _listener = createListener(scrollController, setState);
    scrollController.addListener(_listener);
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
              buildProfileLoadingContent(context),
            );
          case ProfileErrorState():
            return buildScaffolding(
              context,
              buildHeaderSlivers(context),
              buildProfileErrorContent(context),
            );
          case ProfileLoadedState():
            return buildScaffolding(
              context,
              buildProfileLoadedHeaderSlivers(context, state.profile),
              buildProfileLoadedContent(context, state.profile)
            );
          default:
            return const SizedBox.shrink();
        }
      }
    );
  }

  List<Widget> buildProfileLoadingContent(BuildContext context) {
    return [
      const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    ];
  }

  List<Widget> buildProfileErrorContent(BuildContext context) {
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

  List<Widget> buildProfileLoadedContent(BuildContext context, Profile profile) {
    return [
      TabBar(
        padding: const EdgeInsets.symmetric(
          vertical: AppThemeData.spacingSm,
          horizontal: AppThemeData.spacingMd,
        ),
        controller: primaryTC,
        indicator: const ShapeDecoration(
          color: Colors.black,
          shape: StadiumBorder()
        ),
        labelColor: Colors.white,
        labelPadding: const EdgeInsets.symmetric(
          horizontal: AppThemeData.spacingSm
        ),
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        unselectedLabelColor: Colors.black,
        splashFactory: NoSplash.splashFactory,
        // long tap splash still visible
        // make it look better with border radius
        splashBorderRadius: BorderRadius.circular(AppThemeData.borderRadiusLg),
        tabs: [
          buildTabBarItem(context, AppLocalizations.of(context).days),
          buildTabBarItem(context, AppLocalizations.of(context).weeks),
          buildTabBarItem(context, AppLocalizations.of(context).months),
          buildTabBarItem(context, AppLocalizations.of(context).years),
        ],
      ),
      Expanded(
        child: TabBarView(
          controller: primaryTC,
          children: [
            buildTabBarView(
              context,
              'days',
              DaysStatsView(
                profile: profile,
              ),
            ),
            buildTabBarView(
              context,
              'weeks',
              WeeksStatsView(
                profile: profile,
              ),
            ),
            buildTabBarView(
              context,
              'months',
              MonthsStatsView(
                // profile: profile,
              ),
            ),
            buildTabBarView(
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
      controller: scrollController,
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

  List<Widget> buildProfileLoadedHeaderSlivers(BuildContext context, Profile profile) {
    return [
      buildAppBar(context),
      buildProfileDetails(context, profile),
    ];
  }

  Widget buildAppBar(BuildContext context) {
    return SliverAppBar(
      centerTitle: false,
      elevation: 0,
      // stretch: true, // Not working?
      floating: false,
      pinned: true,
      scrolledUnderElevation: 0.0, // Material design wierd transparency effect
      backgroundColor: AppColors.backgroundPaper,
      leading: const Padding(
        padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0,),
        child: CustomBackButton()
      ),
      leadingWidth: 64,
      title: Transform.translate(
        offset: Offset(0, AppThemeData.spacingSm * (1.0 - titleEffectRatio)),
        child: Opacity(
          opacity: titleEffectRatio,
          child: Text(
            AppLocalizations.of(context).profileStats,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildProfileDetails(BuildContext context, Profile profile) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppThemeData.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(context, AppLocalizations.of(context).profileStats),
            const SizedBox(height: AppThemeData.spacingLg),
            Gap.large(),
            SizedBox(
              width: double.infinity,
              child: ConsecutiveDaysDisplay(
                profile: profile,
              ),
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

  Widget buildTabBarItem(BuildContext context, String label) {
    return Tab(
      height: 32,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(label),
      ),
    );
  }

  Widget buildTabBarView(BuildContext context, String id, Widget child) {
    return ExtendedVisibilityDetector(
      uniqueKey: Key(id),
      child: SingleChildScrollView(
        key: PageStorageKey<String>(id),
        child: child,
      ),
    );
  }

  @override
  void dispose() {
    primaryTC.dispose();
    scrollController.removeListener(_listener);
    scrollController.dispose();
    super.dispose();
  }

}
