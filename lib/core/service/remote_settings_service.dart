import 'package:dhyana/core/domain/entity/remote_settings.dart';

abstract interface class RemoteSettingsService {

  Future<RemoteSettings> fetchRemoteSettings();
  RemoteSettings readRemoteSettings();
  Stream<RemoteSettings> get onRemoteSettingsChanged;

}
