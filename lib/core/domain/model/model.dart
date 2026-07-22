abstract interface class Model {
  String get id;
  Map<String, Object?> toJson();
}
