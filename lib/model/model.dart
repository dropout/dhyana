
abstract class Model {
  String get id;
  Map<String, Object?> toFireStore();
}

// abstract class Model<M, E> {
//   String get id;
//   E toEntity();
// }
