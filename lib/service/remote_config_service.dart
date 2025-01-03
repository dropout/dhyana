import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService._create({
    required FirebaseRemoteConfig remoteConfig
  }) : _remoteConfig = remoteConfig;

  static Future<RemoteConfigService> create() async {
    FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    try {
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ));
      await remoteConfig.setDefaults(<String, dynamic>{
        'welcome_message': 'Welcome to our app',
      });
    } on Exception catch (e) {
      print('Unable to fetch remote config. Cached or default values will be used');
      print(e);
    }
    return RemoteConfigService._create(
      remoteConfig: remoteConfig,
    );
  }

  bool get presenceViewEnabled =>
    _remoteConfig.getBool('presence_view_enabled');

}

  // RemoteConfigService({
  //   required FirebaseRemoteConfig remoteConfig
  // }) : _remoteConfig = remoteConfig;

  // Future<void> initialize() async {
  //   try {
  //     await _remoteConfig.setConfigSettings(RemoteConfigSettings(
  //       fetchTimeout: const Duration(seconds: 10),
  //       minimumFetchInterval: const Duration(hours: 1),
  //     ));
  //     await _remoteConfig.setDefaults(<String, dynamic>{
  //       'welcome_message': 'Welcome to our app',
  //     });
  //   } on PlatformException catch (e) {
  //     print('Unable to fetch remote config. Cached or default values will be used');
  //     print(e);
  //   }
  // }
  //
  // String getWelcomeMessage() {
  //   return _remoteConfig.getString('welcome_message');
  // }


 // The  RemoteConfigService  class is responsible for initializing the Remote Config service and fetching the welcome message from the Firebase console.
 // The  initialize  method sets the configuration settings for the Remote Config service and sets the default values for the welcome message.
 // The  getWelcomeMessage  method returns the welcome message from the Remote Config service.
 // Step 4: Initialize the Remote Config Service
 // To initialize the Remote Config service, you need to call the  initialize  method in the  main.dart  file.
