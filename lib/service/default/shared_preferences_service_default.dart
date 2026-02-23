import 'package:shared_preferences/shared_preferences.dart';
import '../shared_preferences_service.dart';

/// Default implementation of [SharedPreferencesService] using the shared_preferences package.
class DefaultSharedPreferencesService implements SharedPreferencesService {
  /// The [SharedPreferences] instance to use for storage operations.
  final SharedPreferences prefs;

  /// Creates a [DefaultSharedPreferencesService] with the given [prefs] instance.
  const DefaultSharedPreferencesService(this.prefs);

  @override
  Future<T?> get<T>({required String key}) async {
    final value = prefs.get(key);
    if (value is T) {
      return value;
    }
    return null;
  }

  @override
  Future<void> set<T>({required String key, required T value}) async {
    if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw ArgumentError('Unsupported value type: \\${value.runtimeType}');
    }
  }

  @override
  Future<void> remove({required String key}) async {
    await prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    await prefs.clear();
  }
}
