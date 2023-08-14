import 'dart:typed_data';

import 'package:dhyana/model/profile.dart';

abstract class ProfileUpdateStrategy {

  Future<Profile> execute();

  String? getFirstName(Map<String,dynamic> formData) {
    if (!formData.containsKey('firstName')) {
      return null;
    }
    return formData['firstName'] as String;
  }

  String? getLastName(Map<String,dynamic> formData) {
    if (!formData.containsKey('lastName')) {
      return null;
    }
    return formData['lastName'] as String;
  }

  Uint8List? getImageData(Map<String,dynamic> formData) {
    if (formData.containsKey('imageData') == false || formData['imageData'] == null) {
      return null;
    }
    return formData['imageData'] as Uint8List;
  }

}
