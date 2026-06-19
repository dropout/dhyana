import 'dart:io';

import 'package:dhyana/service/mindful_minutes_service.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
    if (!Platform.isAndroid && !Platform.isIOS) {
      return _LocalizationDTO(
        title: context.l10n.healthConnect_platformNotSupportedTitle,
        helperText: context.l10n.healthConnect_platformNotSupportedText,
      );
    }

    switch (state) {
      case _WidgetState.initializing:
        return _LocalizationDTO(
          title: Platform.isIOS
              ? context.l10n.healthConnect_initializingText_ios
              : context.l10n.healthConnect_initializingText_android,
          helperText: Platform.isIOS
              ? context.l10n.healthConnect_initializingText_ios
              : context.l10n.healthConnect_initializingText_android
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
      default:
        return _LocalizationDTO(
          title: 'development',
          helperText: 'development'              
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
  bool _initializing = true;
  bool _isServiceAvailable = false;
  bool _hasPermissions = false;

  RequestStatusForAuthorization _requestStatus = .unknown;
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
      return _WidgetState.ready;
    }

    return _WidgetState.requestPermissionUnnecessary;
  }

  void _requestAuthorization(BuildContext context) async {
    final granted = await widget.mindfulMinutesService.requestAuthorization();
    setState(() {
      _hasPermissions = granted;
    });
  }

  @override
  Widget build(BuildContext context) {
  
    final localizationDto = _LocalizationDTO.fromWidgetState(context, widgetState);

    return buildScaffolding(
      context,
      localizationDto.title,
      localizationDto.helperText,
    );
    
  }

  Widget buildScaffolding(
    BuildContext context,
    String title,
    String helperText,
  ) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.backgroundPaperLight,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: DesignSpec.paddingXl,
              vertical: DesignSpec.paddingLg,
            ),
            child: Wrap(
              children: [
                // Text(
                //   title,
                //   style: TextStyle(
                //     fontSize: 14,
                //     fontWeight: FontWeight.w500,
                //   ),                
                // ),
                // Spacer(),

                // Text(helperText),

                FormBuilderSwitch(
                  name: "not_used",
                  title: Text(
                    title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    helperStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                  enabled: false,
                  // initialValue: initialValue,
                  // onChanged: onChanged,
                ),
              ],
            ),
          ),
        ),
        Gap.small(),

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignSpec.paddingXl,
          ),
          child: Text(helperText!, style: context.theme.textTheme.bodyMedium),
        ),
      ],
    );
  }
}
