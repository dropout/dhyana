import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_settings.freezed.dart';

@freezed
sealed class ProfileSettings with _$ProfileSettings {

  const factory ProfileSettings({
    @Default(true) bool showStatsOnFinishScreen,
    @Default(true) bool usePresenceFeature,
  }) = _ProfileSettings;

}
