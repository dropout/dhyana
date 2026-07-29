import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_day_data_provider.dart';
import 'firebase_month_data_provider.dart';
import 'firebase_year_data_provider.dart';
import 'firebase_week_data_provider.dart';

class FirebaseInsightsDataProviderFactory {

  final FirebaseFirestore fireStore;

  FirebaseInsightsDataProviderFactory({required this.fireStore});

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

}
