import 'dart:async';

import 'package:core/src/domain/entity/remote_settings.dart';
import 'package:core/src/service/crashlytics_service.dart';
import 'package:core/src/service/remote_settings_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_settings_cubit.freezed.dart';

@freezed
sealed class RemoteSettingsState with _$RemoteSettingsState {

  const factory RemoteSettingsState.loaded({
    required RemoteSettings settings,
  }) = _Loaded;

}

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
