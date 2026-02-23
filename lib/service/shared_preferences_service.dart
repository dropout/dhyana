/// Service interface for interacting with shared preferences.
///
/// Provides methods to read and write simple key-value pairs.
abstract class SharedPreferencesService {
  /// Reads a value for the given [key].
  Future<T?> get<T>({required String key});

  /// Writes a [value] for the given [key].
  Future<void> set<T>({required String key, required T value});

  /// Removes the value for the given [key].
  Future<void> remove({required String key});

  /// Clears all values.
  Future<void> clear();
}

