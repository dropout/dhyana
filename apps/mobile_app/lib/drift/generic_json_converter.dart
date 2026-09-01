import 'dart:convert';
import 'package:drift/drift.dart';

class GenericJsonConverter extends TypeConverter<Map<String, dynamic>, String> {
  const GenericJsonConverter();

  @override
  Map<String, dynamic> fromSql(String fromDb) {
    try {
      return jsonDecode(fromDb) as Map<String, dynamic>;
    } catch (_) {
      return {}; // Return empty map as a fallback
    }
  }

  @override
  String toSql(Map<String, dynamic> value) {
    return jsonEncode(value);
  }
}