import 'package:dhyana/modules/practice/chanting/domain/entity/chant_entity.dart';
import 'package:dhyana/modules/practice/chanting/public/model/chant.dart';

extension ChantEntityMapper on ChantEntity {
  Chant toApi() {
    return Chant(
      id: id,
      name: name,
      blurHash: blurHash,
      metaData: metaData,
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
      metaData: metaData,
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
