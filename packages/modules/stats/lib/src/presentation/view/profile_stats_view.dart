import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:flutter/rendering.dart';

import 'package:core/core.dart';
import 'package:profile/profile.dart';
import 'package:stats/l10n/stats_localizations.dart';
import 'package:stats/src/presentation/view/stats/stats_data_area_sliver.dart';

import 'stats/tab/day_tab.dart';
import 'stats/tab/month_tab.dart';
import 'stats/tab/week_tab.dart';
import 'stats/tab/year_tab.dart';

class const ProfileStatsView({
  required final Profile profile,
  super.key,
}) extends StatefulWidget {
  @override
  State<ProfileStatsView> createState() => _ProfileStatsViewState();
}

class _ProfileStatsViewState extends State<ProfileStatsView>
    with TickerProviderStateMixin, TitleEffectMixin {
  
  /// Tab controller for barchart tabs
  late final TabController primaryTC;

  @override
  void initState() {
    super.initState();
    primaryTC = TabController(length: 4, vsync: this);    
  }

  @override
  Widget build(BuildContext context) =>
    DefaultScreenSetup(
      title: StatsLocalizations.of(context).profileStats,
      scrollPhysics: const ClampingScrollPhysics(),
      slivers: [
        StatsDataAreaSliver(
          profile: widget.profile,
          profileName: widget.profile.displayName,
          profilePhotoUrl: widget.profile.profileImageStoragePath,
          profilePhotoBlurhash: widget.profile.photoBlurhash,
        ),
        ...buildBarchartSlivers(context, widget.profile.id),
      ],
    );

  List<Widget> buildBarchartSlivers(BuildContext context, String profileId) {
    return [
      PinnedHeaderSliver(child: buildTabBar(context)),
      _SliverFillRemainingCustom(child: buildTabBarView(context, profileId)),
    ];
  }

  Widget buildTabBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: DesignSpec.paddingSm),
      child: TabBar(
        key: const Key('profile_stats_tab_bar'),
        padding: const EdgeInsets.only(
          top: DesignSpec.spacingSm,
          left: DesignSpec.spacingMd,
          right: DesignSpec.spacingMd,
          bottom: DesignSpec.spacingXs,
        ),
        controller: primaryTC,
        indicator: const ShapeDecoration(
          color: Colors.black,
          shape: StadiumBorder(),
        ),
        labelColor: Colors.white,
        labelPadding: const EdgeInsets.symmetric(
          horizontal: DesignSpec.spacingSm,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorAnimation: TabIndicatorAnimation.elastic,
        automaticIndicatorColorAdjustment: false,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        unselectedLabelColor: Colors.black,
        splashFactory: NoSplash.splashFactory,
        // long tap splash still visible
        // make it look better with splash border radius
        splashBorderRadius: BorderRadius.circular(DesignSpec.borderRadiusLg),
        dividerColor: Colors.transparent,
        onTap: (int index) => context.hapticsTap(),
        tabs: [
          buildTabBarItem(
            context,
            StatsLocalizations.of(context).days,
            key: const Key('profile_stats_view_days_tab'),
          ),
          buildTabBarItem(
            context,
            StatsLocalizations.of(context).weeks,
            key: const Key('profile_stats_view_weeks_tab'),
          ),
          buildTabBarItem(
            context,
            StatsLocalizations.of(context).months,
            key: const Key('profile_stats_view_months_tab'),
          ),
          buildTabBarItem(
            context,
            StatsLocalizations.of(context).years,
            key: const Key('profile_stats_view_years_tab'),
          ),
        ],
      ),
    );
  }

  Widget buildTabBarItem(BuildContext context, String label, {Key? key}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingSm),
      child: Tab(key: key, height: 32, child: Text(label)),
    );
  }

  Widget buildTabBarView(BuildContext context, String profileId) {
    return SizedBox(
      height: 540,
      child: TabBarView(
        controller: primaryTC,
        children: [
          DaysTab(profileId: profileId),
          WeekTab(profileId: profileId),
          MonthTab(profileId: profileId),
          YearTab(profileId: profileId),
        ],
      ),
    );
  }

  @override
  void dispose() {
    primaryTC.dispose();
    super.dispose();
  }
}

/// A special sliver that helps the layout of the barchart area with the
/// sticky tabbar.
class _SliverFillRemainingCustom extends SingleChildRenderObjectWidget {
  const _SliverFillRemainingCustom({super.child});

  @override
  RenderSliverFillRemainingCustom createRenderObject(BuildContext context) =>
      RenderSliverFillRemainingCustom();
}

class RenderSliverFillRemainingCustom extends RenderSliverSingleBoxAdapter {
  /// Create a sliver that sizes itself to fill the remaining space
  /// in the viewport when the child is smaller than the space below the
  /// overlapping sticky slivers.
  RenderSliverFillRemainingCustom({super.child});

  double getChildExtent() {
    if (child == null) {
      return 0.0;
    }
    assert(child!.hasSize);
    return switch (constraints.axis) {
      Axis.vertical => child!.size.height,
      Axis.horizontal => child!.size.width,
    };
  }

  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }

    final SliverConstraints constraints = this.constraints;
    child!.layout(constraints.asBoxConstraints(), parentUsesSize: true);

    double childExtent = getChildExtent();

    // If the child is overlapping with the sticky headers,
    // set the size to child extent or to the remaining
    // space extent below the sticky slivers whichever is greater.
    if (constraints.overlap > 0.0) {
      childExtent = math.max(
        childExtent,
        constraints.remainingPaintExtent - constraints.overlap,
      );
    } else {
      // If the child is not overlapping, set the size to child extent or
      // the viewport extent whichever is greater.
      childExtent = math.max(
        child!.size.height,
        constraints.viewportMainAxisExtent,
      );
    }

    final double paintedChildSize = calculatePaintOffset(
      constraints,
      from: 0.0,
      to: childExtent,
    );
    final double cacheExtent = calculateCacheOffset(
      constraints,
      from: 0.0,
      to: childExtent,
    );

    assert(paintedChildSize.isFinite);
    assert(paintedChildSize >= 0.0);

    geometry = SliverGeometry(
      scrollExtent: childExtent,
      paintExtent: paintedChildSize,
      cacheExtent: cacheExtent,
      maxPaintExtent: childExtent,
      hitTestExtent: paintedChildSize,
      hasVisualOverflow:
          childExtent > constraints.remainingPaintExtent ||
          constraints.scrollOffset > 0.0,
    );

    setChildParentData(child!, constraints, geometry!);
  }
}
