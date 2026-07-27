import 'package:dhyana/core/data/data_provider.dart';
import 'package:dhyana/core/domain/entity/presence/presence.dart';
import 'package:dhyana/core/domain/entity/presence/presence_query_options.dart';

abstract interface class PresenceDataProvider implements DataProvider<Presence> {

  Future<List<Presence>> query(PresenceQueryOptions queryOptions);
  Stream<List<Presence>> queryStream(PresenceQueryOptions queryOptions);

}
