import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/firebase/firebase_day_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_month_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_year_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_session_data_provider.dart';

class FirebaseDataProviderFactory {
  final FirebaseFirestore fireStore;

  FirebaseDataProviderFactory({required this.fireStore});

  FirebaseDayDataProvider createDayDataProvider(String profileId) {
    return FirebaseDayDataProvider(fireStore, profileId);
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

}
