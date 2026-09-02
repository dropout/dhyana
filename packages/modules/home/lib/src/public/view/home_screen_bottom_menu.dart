import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';

import 'package:home/src/public/enum/home_screen_view_state.dart';

import 'session_type_toggle.dart';
import 'volume_indicator.dart';

class HomeScreenBottomMenu extends StatefulWidget {
	final ValueChanged<HomeScreenViewState> onSessionTypeChange;
	final HomeScreenViewState sessionType;

	const HomeScreenBottomMenu({
		required this.onSessionTypeChange,
		required this.sessionType,
		super.key,
	});

	@override
	State<HomeScreenBottomMenu> createState() => _HomeScreenBottomMenuState();
}

class _HomeScreenBottomMenuState extends State<HomeScreenBottomMenu> {

	@override
	void initState() {
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		return SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: DesignSpec.paddingLg,
                horizontal: DesignSpec.padding2Xl,
              ),
              child: SizedBox(
                height: 60,
                child: Row(                  
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,                
                  children: [						
                    VolumeIndicator(),
                    Spacer(),
                    buildToggle(context),
                  ],
                ),
              ),
            ),
          ),
        );
	}

  Widget buildToggle(BuildContext context) {
    return SignedIn(
      yes: (context, uid) => SessionTypeToggle(
        key: const ValueKey('session_type_toggle'),
        activeMode: widget.sessionType,
        onModeChanged: widget.onSessionTypeChange,
      ),
      no: const SizedBox.shrink(),
    );
  }

}
