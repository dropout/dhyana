import 'dart:math' as math;
import 'dart:ui';

import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/widget/app_colors.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/profile/stats/all.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
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

    // For the disappearing title effect
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
                [],
                buildProfileLoadingContent(context),
              );
            case ProfileErrorState():
              return buildScaffolding(
                context,
                [],
                buildProfileErrorContent(context),
              );
            case ProfileLoadedState():
              return buildScaffolding(
                context,
                [buildStatsDataArea(context, state.profile)],
                buildProfileLoadedContent(context, state.profile),
              );
            default:
              return const SizedBox.shrink();
          }
        }
    );
  }

  List<Widget> buildProfileLoadingContent(BuildContext context) {
    return [
      SliverFillRemaining(
        hasScrollBody: false,
        child: AppLoadingDisplay(),
      ),
    ];
  }

  List<Widget> buildProfileErrorContent(BuildContext context) {
    return [
      SliverFillRemaining(
        hasScrollBody: false,
        child: AppErrorDisplay(),
      )
    ];
  }

  List<Widget> buildProfileLoadedContent(BuildContext context, Profile profile) {
    return [
      PinnedHeaderSliver(
        child: buildTabBar(context),
      ),
      _SliverFillRemainingCustom(
        child: buildTabBarView(context, profile),
      )
    ];
  }

  Widget buildScaffolding(
    BuildContext context,
    List<Widget> statsAreaSlivers,
    List<Widget> chartAreaSlivers,
  ) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [

        // Appearing-disappearing title effect when scrolling down
        buildTitleEffectAppBar(context, AppLocalizations.of(context).profileStats),

        // Stats data area
        ...statsAreaSlivers,

        // Bar chart area
        ...chartAreaSlivers,

      ],
    );
  }

  Widget buildStatsDataArea(BuildContext context, Profile profile) {
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

  Widget buildTabBarViewItem(
    BuildContext context,
    String pageStorageKeyId,
    Widget child
  ) {
    return child;
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

  Widget buildTabBarItem(BuildContext context, String label) {
    return Tab(
      height: 32,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppThemeData.paddingSm),
        child: Text(label),
      ),
    );
  }

  Widget buildTabBarView(BuildContext context, Profile profile) {
    return SizedBox(
      height: 540,
      child: TabBarView(
        controller: primaryTC,
        children: [
          buildTabBarViewItem(
            context,
            'days',
            DaysStatsView(profile: profile),
          ),
          buildTabBarViewItem(
            context,
            'weeks',
            MonthsStatsView(
              // profile: profile,
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

    final double paintedChildSize =
      calculatePaintOffset(constraints, from: 0.0, to: childExtent);
    final double cacheExtent =
      calculateCacheOffset(constraints, from: 0.0, to: childExtent);

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
