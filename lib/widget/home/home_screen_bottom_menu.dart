import 'package:dhyana/enum/session_type.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/home/session_type_toggle.dart';
import 'package:dhyana/widget/home/volume_indicator.dart';import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';

class HomeScreenBottomMenu extends StatefulWidget {
	final ValueChanged<SessionType> onSessionTypeChange;
	final SessionType sessionType;

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
                vertical:DesignSpec.paddingLg,
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
        activeMode: widget.sessionType,
        onModeChanged: widget.onSessionTypeChange,
      ),
      no: const SizedBox.shrink(),
    );
  }

}
