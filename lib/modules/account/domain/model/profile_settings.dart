import 'package:dhyana/core/domain/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_settings.freezed.dart';
part 'profile_settings.g.dart';

@freezed
sealed class ProfileSettings with _$ProfileSettings implements Model {

  const factory ProfileSettings({
    required String id,
    @Default(true) bool showStatsOnFinishScreen,
    @Default(true) bool usePresenceFeature,
  }) = _ProfileSettings;

  factory ProfileSettings.fromJson(Map<String, dynamic> json) =>
    _$ProfileSettingsFromJson(json);

}
