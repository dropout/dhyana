import 'dart:async';

import 'package:dhyana/model/remote_settings.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/remote_settings_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_settings_state.dart';
part 'remote_settings_cubit.freezed.dart';

class RemoteSettingsCubit extends Cubit<RemoteSettingsState> {

  final RemoteSettingsService remoteSettingsService;
  final CrashlyticsService crashlyticsService;
  StreamSubscription<RemoteSettings>? _remoteSettingsSubscription;

  RemoteSettingsCubit({
    required RemoteSettings initialRemoteSettings,
    required this.remoteSettingsService,
    required this.crashlyticsService,
  }) : super(RemoteSettingsState.loaded(settings: initialRemoteSettings)) {

    // Listen for remote settings changes
    _remoteSettingsSubscription = remoteSettingsService.onRemoteSettingsChanged
      .listen((settings) => emit(RemoteSettingsState.loaded(settings: settings)));
  }

  Future<void> fetchRemoteSettings() async {
    try {
      final RemoteSettings remoteSettings =
        await remoteSettingsService.fetchRemoteSettings();
      emit(RemoteSettingsState.loaded(settings: remoteSettings));
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Failed to fetch remote settings',
      );
    }
  }

  @override
  Future<void> close() {
    _remoteSettingsSubscription?.cancel();
    return super.close();
  }

}
