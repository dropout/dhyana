import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/bloc_provider/presence_bloc_provider.dart';
import 'package:dhyana/widget/presence/presence_view.dart';
import 'package:dhyana/widget/screen/default_screen_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PresenceScreen extends StatefulWidget {
  const PresenceScreen({super.key});

  @override
  State<PresenceScreen> createState() => _PresenceScreenState();
}

class _PresenceScreenState extends State<PresenceScreen>
  with DefaultScreenSetupHelpersMixin {

  double intervalInMinutes = 60;

  void _onIntervalChange(BuildContext context, double value) {
    setState(() {
      intervalInMinutes = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PresenceBlocProvider(
      initialEvent: PresenceEvent.load(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        extendBodyBehindAppBar: true,
        body: buildStates(context),
      ),
    );
  }

  Widget buildStates(BuildContext context) {
    return BlocBuilder<PresenceBloc, PresenceState>(
      builder: (BuildContext context, PresenceState state) {
        switch (state) {
          case PresenceLoadingState():
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).presence,
              enableScrolling: false,
              slivers: [
                buildControlsArea(context, controlsEnabled: false),
                buildLoadingSliver(context)
              ],
            );
          case PresenceLoadedState():
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).presence,
              slivers: [
                buildControlsArea(context),
                SliverSafeArea(
                  top: false,
                  sliver: SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppThemeData.spacingMd),
                      child: PresenceView(),
                    ),
                  ),
                ),
              ],
            );
          case PresenceErrorState():
            return DefaultScreenSetup(
              enableScrolling: false,
              title: AppLocalizations.of(context).presence,
              slivers: [
                buildControlsArea(context, controlsEnabled: false),
                buildErrorSliver(context)
              ],
            );
          default:
            return DefaultScreenSetup(
              title: AppLocalizations.of(context).presence,
              enableScrolling: false,
              slivers: [
                buildControlsArea(context, controlsEnabled: false),
              ],
            );
        }
      },
    );
  }

  Widget buildControlsArea(BuildContext context, {
    bool controlsEnabled = true,
  }) {
    return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppThemeData.paddingLg
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context).presenceScreenSubTitle),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppThemeData.paddingLg),
                child: Slider(
                  divisions: 17,
                  min: 10,
                  max: 180,
                  activeColor: Colors.black,
                  label: AppLocalizations.of(context)
                    .minutesPluralWithNumber(intervalInMinutes.round()),
                  value: intervalInMinutes,
                  onChanged: controlsEnabled ? (sliderValue) =>
                    _onIntervalChange(context, sliderValue) : null,
                ),
              )
            ],
          ),
        )
    );
  }

}
