// import 'package:dhyana/modules/practice/chanting/data/mapper/chant_mapper.dart';
// import 'package:dhyana/modules/practice/chanting/public/model/chanting_settings.dart'
//     as model;
// import 'package:dhyana/modules/practice/chanting/domain/entity/chanting_settings_entity.dart';

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
