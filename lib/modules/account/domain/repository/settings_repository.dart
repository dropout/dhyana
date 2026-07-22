import 'package:dhyana/modules/account/domain/model/profile_settings.dart';
import 'package:dhyana/core/domain/repository/crud_repository.dart';

abstract interface class SettingsRepository
  implements CrudRepository<ProfileSettings> {}
