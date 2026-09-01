abstract interface class Dto {
  String get id;
  Map<String, Object?> toJson();
}
