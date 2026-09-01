import 'package:chanting/src/data/mapper/chant_meta_data_mapper.dart';
import 'package:chanting/src/domain/entity/chant_entity.dart';
import 'package:chanting/src/public/model/chant.dart';

extension ChantEntityMapper on ChantEntity {
  Chant toApi() {
    return Chant(
      id: id,
      name: name,
      blurHash: blurHash,
      metaData: metaData.toApi(),
      order: order,
      length: length,
    );
  }
}

extension ChantMapper on Chant {
  ChantEntity toDomain() {
    return ChantEntity(
      id: id,
      name: name,
      metaData: metaData.toDomain(),
      blurHash: blurHash,
      order: order,
      length: length,
    );
  }

  // ChantingSettingsPlaylistItem toPlaylistItem() {
  //   return ChantingSettingsPlaylistItem(
  //     id: id,
  //     chantId: id,
  //     name: name,
  //     blurHash: blurHash,
  //     order: order,
  //     duration: length,
  //   );
  // }
}
