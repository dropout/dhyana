import 'package:dhyana/data_provider/settings_data_provider.dart';
import 'package:dhyana/model/profile_settings.dart';
import 'package:dhyana/repository/all.dart';

/// A Firebase implementation of SettingsRepository for managing ProfileSettings.
/// It uses SettingsDataProvider to perform CRUD operations.
class FirebaseSettingsRepository extends CrudRepositoryOps<ProfileSettings>
  implements SettingsRepository {

  final SettingsDataProvider settingsDataProvider;

  const FirebaseSettingsRepository({
    required this.settingsDataProvider
  }) : super(settingsDataProvider);

  /// Updates the ProfileSettings if it exists; otherwise, creates a new one.
  /// This is useful in scenarios where the settings document
  /// may not exist yet for the specific user.
  @override
  Future<void> update(ProfileSettings model) async {
    final exists = await settingsDataProvider.exists(model.id);
    if (exists) {
      await super.update(model);
    } else {
      await super.create(model);
    }
  }

}
