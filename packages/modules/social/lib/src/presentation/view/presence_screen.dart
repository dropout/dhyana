import 'package:social/src/social_module.dart';
import 'package:core/core.dart';
import 'package:social/l10n/social_localizations.dart';
import 'package:social/src/public/view/presence_view.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PresenceScreen extends StatefulWidget {
  final int batchSize;

  const PresenceScreen({
    this.batchSize = 18, // 3 * 6 profiles per batch
    super.key,
  });

  @override
  State<PresenceScreen> createState() => _PresenceScreenState();
}

class _PresenceScreenState extends State<PresenceScreen>
    with DefaultScreenSetupHelpersMixin {
  double sliderPosition = 60;
  double intervalInMinutes = 60;

  void _onIntervalChange(BuildContext context, double value) {
    setState(() {
      sliderPosition = value;
    });
  }

  void _onIntervalChangeEnd(BuildContext context, double value) {
    if (value.round() != intervalInMinutes.round()) {
      context.read<PresenceCubit>().loadPresenceData(
        windowSize: Duration(minutes: value.round()),
        limit: widget.batchSize,
      );
      setState(() {
        intervalInMinutes = value;
      });
    }
  }

  Future<void> _onRefresh(BuildContext context) async {
    context.read<PresenceCubit>().loadPresenceData(
      windowSize: Duration(minutes: intervalInMinutes.round()),
      limit: widget.batchSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PresenceCubit>(
      create: (context) =>
        GetIt.instance.get<PresenceCubit>()..loadPresenceData(
          windowSize: Duration(minutes: sliderPosition.round()),
          limit: widget.batchSize,
        ),
      child: Builder(
        builder: (context) => buildStates(context),
      ),
    );
  }

  Widget buildStates(BuildContext context) {
    return BlocBuilder<PresenceCubit, PresenceState>(
      builder: (BuildContext context, PresenceState state) {
        switch (state) {
          case PresenceLoadingState():
            return DefaultScreenSetup(
              title: SocialLocalizations.of(context).presence,
              enableScrolling: false,
              enablePullToRefresh: true,
              onRefresh: () => _onRefresh(context),
              slivers: [
                buildControlsArea(context, controlsEnabled: false),
                buildLoadingSliver(context),
              ],
            );
          case PresenceLoadedState():
            return DefaultScreenSetup(
              title: SocialLocalizations.of(context).presence,
              enablePullToRefresh: true,
              onRefresh: () => _onRefresh(context),
              slivers: [
                buildControlsArea(context),
                SliverSafeArea(
                  top: false,
                  sliver: SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: DesignSpec.spacingMd,
                      ),
                      child: PresenceView(batchSize: widget.batchSize),
                    ),
                  ),
                ),
              ],
            );
          case PresenceLoadingMoreState():
            return DefaultScreenSetup(
              title: SocialLocalizations.of(context).presence,
              slivers: [
                buildControlsArea(context),
                SliverSafeArea(
                  top: false,
                  sliver: SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: DesignSpec.spacingMd,
                      ),
                      child: PresenceView(batchSize: widget.batchSize),
                    ),
                  ),
                ),
              ],
            );
          case PresenceErrorState():
            return DefaultScreenSetup(
              enableScrolling: false,
              title: SocialLocalizations.of(context).presence,
              slivers: [
                buildControlsArea(context, controlsEnabled: false),
                buildErrorSliver(context),
              ],
            );
          default:
            return DefaultScreenSetup(
              title: SocialLocalizations.of(context).presence,
              enableScrolling: false,
              slivers: [buildControlsArea(context, controlsEnabled: false)],
            );
        }
      },
    );
  }

  Widget buildControlsArea(
    BuildContext context, {
    bool controlsEnabled = true,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: DesignSpec.paddingLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(SocialLocalizations.of(context).presenceScreenSubTitle),
            Padding(
              padding: EdgeInsets.symmetric(vertical: DesignSpec.paddingLg),
              child: Slider(
                divisions: 17,
                min: 10,
                max: 180,
                activeColor: Colors.black,
                label: SocialLocalizations.of(
                  context,
                ).minutesPluralWithNumber(sliderPosition.round()),
                value: sliderPosition,
                onChanged: controlsEnabled
                    ? (sliderValue) => _onIntervalChange(context, sliderValue)
                    : null,
                onChangeEnd: (sliderValue) =>
                    _onIntervalChangeEnd(context, sliderValue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
