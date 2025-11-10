import 'package:dhyana/model/remote_settings.dart';

abstract interface class RemoteSettingsService {

  Future<RemoteSettings> fetchRemoteSettings();
  RemoteSettings readRemoteSettings();
  Stream<RemoteSettings> get onRemoteSettingsChanged;

}
