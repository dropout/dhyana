import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/presence.dart';
import 'package:dhyana/model/presence_query_options.dart';
import 'package:dhyana/repository/presence_repository.dart';

class FirebasePresenceRepository implements PresenceRepository {

  final PresenceDataProvider presenceDataProvider;

  const FirebasePresenceRepository({
    required this.presenceDataProvider,
  });

  @override
  Future<List<Presence>> getPresence(String? ownProfileId) async {
    List<Presence> items = await presenceDataProvider.query(
      const PresenceQueryOptions(
        windowSize: Duration(hours: 3),
      )
    );

    if (ownProfileId != null) {
      items = items.where((p) => p.profile.id != ownProfileId).toList();
    }

    return items;
  }

  @override
  Future<void> showPresence(Presence presence) {
    return presenceDataProvider.create(presence);
  }

}
