import 'package:dhyana/bloc/home_screen/home_screen_cubit.dart';
import 'package:dhyana/enum/session_type.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/home/session_type_toggle.dart';
import 'package:dhyana/widget/home/volume_indicator.dart';
import 'package:dhyana/widget/session/session_start_button.dart';
import 'package:dhyana/widget/util/signed_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A Widget that displays the bottom menu of the home screen.
/// It has the following parameters:
/// - [onStartButtonTap]: A callback function that is called when the start button is tapped.
/// - [onSessionTypeChange]: A callback function that is called when the session type is changed.
/// - [startButtonColorA]: The first color of the gradient for the start button.
/// - [startButtonColorB]: The second color of the gradient for the start button.

/// The widget contains a [SessionStartButton] and a [SessionTypeSelector] in a row that allows the user to select the session type.
/// The row is vertically aligned to the bottom of the screen and has a padding of 16 pixels on all sides.
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
            alignment: Alignment.bottomLeft,
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
                    SessionTypeToggle(
                      activeMode: widget.sessionType, 
                      onModeChanged: widget.onSessionTypeChange
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
	}

    /// Builds the [SessionTypeToggle] that lets the user switch between
  /// [SessionType.timer] and [SessionType.chanting].
  ///
  /// Mode changes are forwarded to [HomeScreenCubit.setSessionType], which
  /// persists the selection via [SharedPreferencesService] and emits a new
  /// [HomeScreenStateLoaded] with the updated [SessionType].
  Widget buildToggle(BuildContext context, HomeScreenStateLoaded state) {
    return SignedIn(
      yes: (context, uid) => SessionTypeToggle(
        activeMode: state.sessionType,
        onModeChanged: (mode) {
          final hsCubit = context.read<HomeScreenCubit>();
          switch (mode) {
            case SessionType.timer:
              hsCubit.setSessionType(SessionType.timer);
              break;
            case SessionType.chanting:
              hsCubit.setSessionType(SessionType.chanting);
              break;
          }
        },
      ),
      no: const SizedBox.shrink(),
    );
  }

}
