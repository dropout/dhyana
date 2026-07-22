import 'dart:io';

import 'package:dhyana/service/mindful_minutes_service.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';

enum _WidgetState {
  initializing,
  serviceNotAvailable,
  requestPermissionUnnecessary,
  ready,
}

class _LocalizationDTO {
  final String title;
  final String helperText;

  _LocalizationDTO({required this.title, required this.helperText});

  factory _LocalizationDTO.fromWidgetState(
    BuildContext context,
    _WidgetState state,
  ) {
    // Technically this shouldn't happen since the widget doesn't
    // render anything if the platform is not supported.
    if (!Platform.isAndroid && !Platform.isIOS) {
      return _LocalizationDTO(title: "", helperText: "");
    }

    switch (state) {
      case _WidgetState.initializing:
        return _LocalizationDTO(
          title: Platform.isIOS
              ? context.l10n.healthConnect_initializingText_ios
              : context.l10n.healthConnect_initializingText_android,
          helperText: Platform.isIOS
              ? context.l10n.healthConnect_initializingText_ios
              : context.l10n.healthConnect_initializingText_android,
        );
      case _WidgetState.serviceNotAvailable:
        return _LocalizationDTO(
          title: Platform.isIOS
              ? context.l10n.healthConnect_serviceNotAvailableTitle_ios
              : context.l10n.healthConnect_serviceNotAvailableTitle_android,
          helperText: Platform.isIOS
              ? context.l10n.healthConnect_serviceNotAvailableText_ios
              : context.l10n.healthConnect_serviceNotAvailableText_android,
        );
      case _WidgetState.ready:
        return _LocalizationDTO(
          title: Platform.isIOS
              ? context.l10n.healthConnect_readyTitle_ios
              : context.l10n.healthConnect_readyTitle_android,
          helperText: Platform.isIOS
              ? context.l10n.healthConnect_readyText_ios
              : context.l10n.healthConnect_readyText_android,
        );
      case _WidgetState.requestPermissionUnnecessary:
        return _LocalizationDTO(
          title: Platform.isIOS
              ? context.l10n.healthConnect_unnecessaryTitle_ios
              : context.l10n.healthConnect_unnecessaryTitle_android,
          helperText: Platform.isIOS
              ? context.l10n.healthConnect_unnecessaryText_ios
              : context.l10n.healthConnect_unnecessaryText_android,
        );
    }
  }
}

class ProfileSettingsHealthConnect extends StatefulWidget {
  final MindfulMinutesService mindfulMinutesService;

  const ProfileSettingsHealthConnect({
    required this.mindfulMinutesService,
    super.key,
  });

  @override
  State<ProfileSettingsHealthConnect> createState() =>
      _ProfileSettingsHealthConnectState();
}

class _ProfileSettingsHealthConnectState
    extends State<ProfileSettingsHealthConnect> {
  /// Indicates whether the widget is still initializing and checking the service status.
  bool _initializing = true;

  /// Indicates whether the service required to store mindful minutes on the platform is available.
  bool _isServiceAvailable = false;

  /// Indicates the current request status for authorization to access mindful minutes data.
  RequestStatusForAuthorization _requestStatus = .unknown;

  /// Indicates the current authorization status for accessing mindful minutes data.
  AuthorizationStatus? _authorizationStatus = .notDetermined;

  @override
  void initState() {
    super.initState();

    if (!isPlatformSupported) {
      return;
    }

    _updateServiceStatus();
  }

  void _updateServiceStatus() async {
    final isAvailable = await widget.mindfulMinutesService.isServiceAvailable();
    final requestStatus = await widget.mindfulMinutesService
        .getRequestForAuthorizationStatus();
    final authorizationStatus = await widget.mindfulMinutesService
        .getAuthorizationStatus();
    setState(() {
      _isServiceAvailable = isAvailable;
      _requestStatus = requestStatus;
      _authorizationStatus = authorizationStatus;
      _initializing = false;
    });
  }

  bool get isPlatformSupported => Platform.isAndroid || Platform.isIOS;

  _WidgetState get widgetState {
    if (_initializing) {
      return _WidgetState.initializing;
    }

    if (!_isServiceAvailable) {
      return _WidgetState.serviceNotAvailable;
    }

    if (_requestStatus == RequestStatusForAuthorization.unnecessary) {
      return _WidgetState.requestPermissionUnnecessary;
    }

    if (_authorizationStatus == AuthorizationStatus.authorized) {
      return _WidgetState.requestPermissionUnnecessary;
    }

    return _WidgetState.ready;
  }

  bool get isToggleEnabled => widgetState == _WidgetState.ready;

  bool get initialValue =>
      _authorizationStatus == AuthorizationStatus.authorized;

  void _requestAuthorization(BuildContext context) async {
    await widget.mindfulMinutesService.requestAuthorization();
    _updateServiceStatus();
  }

  @override
  Widget build(BuildContext context) {
    final localizationDto = _LocalizationDTO.fromWidgetState(
      context,
      widgetState,
    );

    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            // color: AppColors.backgroundPaperLight,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Wrap(
              children: [
                SwitchListTile(
                  title: Text(
                    localizationDto.title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  tileColor: AppColors.backgroundPaperLight,
                  inactiveThumbColor: AppColors.backgroundPaperDark,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: DesignSpec.paddingXl,
                    vertical: DesignSpec.paddingLg,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  value: initialValue,
                  onChanged: isToggleEnabled
                      ? (value) {
                          if (value == true) {
                            _requestAuthorization(context);
                          }
                        }
                      : null,
                ),
              ],
            ),
          ),
        ),
        Gap.small(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingXl),
          child: Text(localizationDto.helperText, style: context.theme.textTheme.bodyMedium),
        ),
      ],
    );
  }  
}
