import 'package:dhyana/data_provider/data_provider.dart';
import 'package:dhyana/model/presence.dart';
import 'package:dhyana/model/presence_query_options.dart';

abstract interface class PresenceDataProvider implements DataProvider<Presence> {

  Future<List<Presence>> query(PresenceQueryOptions queryOptions);
  Stream<List<Presence>> queryStream(PresenceQueryOptions queryOptions);

}
