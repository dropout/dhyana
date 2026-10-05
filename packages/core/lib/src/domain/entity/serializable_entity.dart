abstract interface class SerializableEntity {
  String get id;
  Map<String, Object?> toJson();
}
