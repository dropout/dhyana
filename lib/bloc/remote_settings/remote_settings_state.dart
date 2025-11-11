
part of 'remote_settings_cubit.dart';

@freezed
class RemoteSettingsState with _$RemoteSettingsState {

  const factory RemoteSettingsState.loaded({
    required RemoteSettings settings,
  }) = _Loaded;

}

