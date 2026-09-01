// import 'package:chanting/src/data/mapper/chant_mapper.dart';
// import 'package:chanting/src/public/model/chanting_settings.dart'
//     as model;
// import 'package:chanting/src/domain/entity/chanting_settings_entity.dart';

// extension ChantingSettingsEntityMapper on ChantingSettingsEntity {
//   model.ChantingSettings toApi() {
//     return model.ChantingSettings(
//       selectedChants: selectedChants
//           .map((selectedChant) => selectedChant.toDomain())
//           .toList(growable: false),
//       lastUsed: lastUsed,
//     );
//   }
// }

// extension ChantingSettingsMapper on model.ChantingSettings {
//   domain.ChantingSettingsEntity toDomain() {
//     return domain.ChantingSettingsEntity(
//       selectedChants: selectedChants
//           .map((selectedChant) => selectedChant.toDomain())
//           .toList(growable: false),
//       lastUsed: lastUsed,
//     );
//   }
// }
