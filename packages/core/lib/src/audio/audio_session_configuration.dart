import 'package:audio_session/audio_session.dart';

/// Provides a centralized configuration for the audio session used by the app.
AudioSessionConfiguration getAudioSessionConfiguration() {
  return const AudioSessionConfiguration(

    // ios
    avAudioSessionCategory: .playback,
    avAudioSessionMode: .defaultMode,
    avAudioSessionCategoryOptions: .none,
    avAudioSessionRouteSharingPolicy: AVAudioSessionRouteSharingPolicy.defaultPolicy,
    avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.notifyOthersOnDeactivation,

    // android
    androidAudioAttributes: AndroidAudioAttributes(
      contentType: AndroidAudioContentType.music,
      flags: AndroidAudioFlags.none,
      usage: AndroidAudioUsage.media,
    ),
    androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
    androidWillPauseWhenDucked: false,

  );
}
