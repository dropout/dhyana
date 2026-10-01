import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_settings.freezed.dart';

@freezed
sealed class ProfileSettings with _$ProfileSettings {

  static const String showStatsKey = 'showStats';
  static const String usePresenceFeatureKey = 'usePresenceFeature';

  const factory ProfileSettings({
    @Default(true) bool showStats,
    @Default(true) bool usePresenceFeature,
  }) = _ProfileSettings;

}
