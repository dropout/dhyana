import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_day_data_provider.dart';
import 'firebase_month_data_provider.dart';
import 'firebase_profile_data_provider.dart';
import 'firebase_year_data_provider.dart';
import 'firebase_session_data_provider.dart';
import 'firebase_week_data_provider.dart';

class FirebaseDataProviderFactory {

  final FirebaseFirestore fireStore;

  FirebaseDataProviderFactory({required this.fireStore});

  FirebaseDayDataProvider createDayDataProvider(String profileId) {
    return FirebaseDayDataProvider(fireStore, profileId);
  }

  FirebaseWeekDataProvider createWeekDataProvider(String profileId) {
    return FirebaseWeekDataProvider(fireStore, profileId);
  }

  FirebaseMonthDataProvider createMonthDataProvider(String profileId) {
    return FirebaseMonthDataProvider(fireStore, profileId);
  }

  FirebaseYearDataProvider createYearDataProvider(String profileId) {
    return FirebaseYearDataProvider(fireStore, profileId);
  }

  FirebaseSessionDataProvider createSessionDataProvider(String profileId) {
    return FirebaseSessionDataProvider(fireStore, profileId);
  }

  FirebaseProfileDataProvider createProfileDataProvider() {
    return FirebaseProfileDataProvider(fireStore);
  }

}
