import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/settings_data_provider.dart';
import 'package:dhyana/model/profile_settings.dart';

import 'firebase_data_provider.dart';

/// A Firebase Firestore data provider for ProfileSettings.
/// Implements CRUD operations specific to ProfileSettings.
/// It does not provide methods for listing multiple settings,
/// as there is typically only one settings document per user.
class FirebaseSettingsDataProvider
    extends FirebaseDataProvider<ProfileSettings>
    implements SettingsDataProvider {

  FirebaseSettingsDataProvider(FirebaseFirestore fireStore) : super(
    fireStore.collection('profile_settings')
      .withConverter<ProfileSettings>(
        fromFirestore: (snapshot, _) => ProfileSettings.fromJson(snapshot.data()!),
        toFirestore: (settings, _) => settings.toJson()
      )
  );

}
