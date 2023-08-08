class AppSettings {

  final bool appleHealthSync;

  const AppSettings({
    required this.appleHealthSync,
  });

  AppSettings copyWith({
    bool? appleHealthSync,
  }) {
    return AppSettings(
      appleHealthSync: appleHealthSync ?? this.appleHealthSync,
    );
  }

}