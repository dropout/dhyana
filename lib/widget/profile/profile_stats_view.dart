import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/bloc/stats_interval/stats_interval_bloc.dart';
import 'package:dhyana/enum/stats_interval_type.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/stats_interval.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/profile/stats/stats_interval_display.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:dhyana/widget/util/title_effect.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileStatsView extends StatelessWidget {
  const ProfileStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StatsIntervalBloc>(
      create: (BuildContext context) {
        return StatsIntervalBloc(
          StatsIntervalState.loaded(
            statsInterval: StatsInterval.days(now: DateTime.now()),
          ),
        );
      },
      child: ProfileStatsViewContent(),
    );
  }
}

class ProfileStatsViewContent extends StatefulWidget {
  const ProfileStatsViewContent({super.key});

  @override
  State<ProfileStatsViewContent> createState() => _ProfileStatsViewContentState();
}

class _ProfileStatsViewContentState extends State<ProfileStatsViewContent>
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
                buildDefaultHeaderSlivers(context),
                buildProfileLoadingContent(context),
              );
            case ProfileErrorState():
              return buildScaffolding(
                context,
                buildDefaultHeaderSlivers(context),
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
        padding: const EdgeInsets.only(
          top: AppThemeData.spacingSm,
          left: AppThemeData.spacingMd,
          right: AppThemeData.spacingMd,
          bottom: AppThemeData.spacingXs,
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
        dividerColor: Colors.transparent,
        tabs: [
          buildTabBarItem(context, AppLocalizations.of(context).days),
          buildTabBarItem(context, AppLocalizations.of(context).weeks),
          buildTabBarItem(context, AppLocalizations.of(context).months),
          buildTabBarItem(context, AppLocalizations.of(context).years),
        ],
      ),

      buildIntervalText(context),

      Expanded(
        child: TabBarView(
          controller: primaryTC,
          children: [
            buildTabBarView(
              context,
              'days',
              DaysStatsView(profile: profile),
            ),
            buildTabBarView(
              context,
              'weeks',
              WeeksStatsView(
                profile: profile,
                statsIntervalBloc: BlocProvider.of<StatsIntervalBloc>(context),
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
      physics: const ClampingScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return headerSlivers;
      },
      pinnedHeaderSliverHeightBuilder: () => pinnedHeaderHeight,
      onlyOneScrollInBody: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      ),
    );
  }

  List<Widget> buildDefaultHeaderSlivers(BuildContext context) {
    return [
      buildTitleEffectAppBar(context, AppLocalizations.of(context).profileStats),
    ];
  }

  List<Widget> buildProfileLoadedHeaderSlivers(
    BuildContext context,
    Profile profile
  ) {
    return [
      buildTitleEffectAppBar(context, AppLocalizations.of(context).profileStats),
      buildProfileDetails(context, profile),
    ];
  }

  Widget buildProfileDetails(BuildContext context, Profile profile) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppThemeData.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitleEffectTitle(context, AppLocalizations.of(context).profileStats),
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
            // Gap.large(),
          ],
        ),
      ),
    );
  }

  Widget buildIntervalText(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<StatsIntervalBloc, StatsIntervalState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppThemeData.paddingLg,
            vertical: AppThemeData.paddingMd,
          ),
          child: StatsIntervalDisplay(
            statsInterval: state.statsInterval,
          )
        );
      }),
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

  Widget buildTabBarView(
    BuildContext context,
    String pageStorageKeyId,
    Widget child
  ) {
    return ExtendedVisibilityDetector(
      uniqueKey: Key(pageStorageKeyId),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        key: PageStorageKey<String>(pageStorageKeyId),
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
