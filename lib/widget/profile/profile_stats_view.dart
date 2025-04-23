import 'dart:math' as math;
import 'dart:ui';

import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:dhyana/widget/util/title_effect.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ProfileStatsView extends StatefulWidget {

  final String profileId;

  const ProfileStatsView({
    required this.profileId,
    super.key,
  });

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

  Widget buildProfileLoadingContent(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildProfileErrorContent(BuildContext context) {
    return Center(
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
    );
  }

  Widget buildProfileLoadedContent(BuildContext context, Profile profile) {
    return SizedBox(
      height: 540,
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
            MonthsStatsView(
              // profile: profile,
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
    );
  }

  Widget buildScaffolding(
    BuildContext context,
    List<Widget> headerSlivers,
    Widget child,
  ) {
    final SliverOverlapAbsorberHandle handle = SliverOverlapAbsorberHandle();
    //
    // return NestedScrollView(
    //   controller: scrollController,
    //   headerSliverBuilder: (builderContext, innerBoxIsScrolled) {
    //     return [
    //       // buildTitleEffectAppBar(context, AppLocalizations.of(context).profileStats),
    //       SliverOverlapAbsorber(
    //         handle: handle,
    //         sliver: buildTitleEffectAppBar(context, AppLocalizations.of(context).profileStats),
    //       ),
    //       // SliverOverlapAbsorber(handle: handle),
    //
    //       ...headerSlivers,
    //       // SliverOverlapAbsorber(
    //       //   handle: handle,
    //       //   sliver: PinnedHeaderSliver(
    //       //     child: buildTabBar(context),
    //       //   ),
    //       // )
    //     ];
    //   },
    //   body: CustomScrollView(
    //     slivers: [
    //       SliverOverlapInjector(
    //         handle: handle,
    //       ),
    //       PinnedHeaderSliver(
    //         child: buildTabBar(context),
    //       ),
    //       SliverToBoxAdapter(
    //         child: child
    //       ),
    //     ],
    //   ),
    // );

    return CustomScrollView(
      controller: scrollController,
      slivers: [

        buildTitleEffectAppBar(context, AppLocalizations.of(context).profileStats),
        ...headerSlivers,
        PinnedHeaderSliver(
          child: buildTabBar(context),
        ),

        _SliverFillRemainingCustom(
          child: child,
        ),

      ],
    );
  }

  Widget buildTabBar(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundPaper,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppThemeData.paddingSm),
        child: TabBar(
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
      ),
    );
  }

  List<Widget> buildDefaultHeaderSlivers(BuildContext context) {
    return [
      // buildTitleEffectAppBar(context, AppLocalizations.of(context).profileStats),
    ];
  }

  List<Widget> buildProfileLoadedHeaderSlivers(
    BuildContext context,
    Profile profile
  ) {
    return [
      // buildTitleEffectAppBar(context, AppLocalizations.of(context).profileStats),
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
            Gap.medium(),
            DetailedProfileView(profile: profile),
            Gap.medium(),
            DetailedConsecutiveDaysView(profile: profile),
            Gap.medium(),
            DetailedMilestonesView(profile: profile),
            Gap.medium(),
            DetailedSummaryView(profile: profile),
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

  Widget buildTabBarView(
    BuildContext context,
    String pageStorageKeyId,
    Widget child
  ) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        // padding: const EdgeInsets.symmetric(vertical: AppThemeData.paddingLg),
        padding: const EdgeInsets.all(0),
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


class _SliverFillRemainingCustom extends SingleChildRenderObjectWidget {
  const _SliverFillRemainingCustom({super.child});

  @override
  RenderSliverFillRemainingCustom createRenderObject(BuildContext context) =>
      RenderSliverFillRemainingCustom();
}

class RenderSliverFillRemainingCustom extends RenderSliverSingleBoxAdapter {
  /// Creates a [RenderSliver] that wraps a scrollable [RenderBox] which is
  /// sized to fit the remaining space in the viewport.
  RenderSliverFillRemainingCustom({super.child});

  // double get childExtent {
  //   if (child == null) {
  //     return 0.0;
  //   }
  //   assert(child!.hasSize);
  //   return switch (constraints.axis) {
  //     Axis.vertical => child!.size.height,
  //     Axis.horizontal => child!.size.width,
  //   };
  // }

  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }
    final SliverConstraints constraints = this.constraints;
    child!.layout(constraints.asBoxConstraints(), parentUsesSize: true);


    double childExtent = child!.size.height;
    if (constraints.overlap > 0.0) {
      childExtent = constraints.remainingPaintExtent - constraints.overlap;
    } else {
      childExtent = math.max(
        child!.size.height,
        constraints.viewportMainAxisExtent,
      );
    }

    final double paintedChildSize = calculatePaintOffset(constraints, from: 0.0, to: childExtent);
    final double cacheExtent = calculateCacheOffset(constraints, from: 0.0, to: childExtent);

    assert(paintedChildSize.isFinite);
    assert(paintedChildSize >= 0.0);

    geometry = SliverGeometry(
      scrollExtent: childExtent,
      paintExtent: paintedChildSize,
      cacheExtent: cacheExtent,
      maxPaintExtent: childExtent,
      hitTestExtent: paintedChildSize,
      hasVisualOverflow:
      childExtent > constraints.remainingPaintExtent || constraints.scrollOffset > 0.0,
    );

    setChildParentData(child!, constraints, geometry!);
  }
}
