import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/modules/social/domain/entity/presence.dart';
import 'package:dhyana/modules/social/domain/entity/presence_query_options.dart';

abstract interface class PresenceDataProvider implements DataProvider<Presence> {

  Future<List<Presence>> query(PresenceQueryOptions queryOptions);
  Stream<List<Presence>> queryStream(PresenceQueryOptions queryOptions);

}
