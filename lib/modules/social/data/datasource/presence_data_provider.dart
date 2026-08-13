import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/modules/social/domain/entity/presence_entity.dart';
import 'package:dhyana/modules/social/domain/entity/presence_query_options_entity.dart';

abstract interface class PresenceDataProvider implements DataProvider<PresenceEntity> {

  Future<List<PresenceEntity>> query(PresenceQueryOptionsEntity queryOptions);
  Stream<List<PresenceEntity>> queryStream(PresenceQueryOptionsEntity queryOptions);

}
