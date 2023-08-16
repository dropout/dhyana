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
  Future<List<Presence>> getPresence(String? ownProfileId) {
    return presenceDataProvider.getItems(
      PresenceQueryOptions(
        ownProfileId: ownProfileId
      )
    );
  }

  @override
  Future<void> showPresence(Presence presence) {
    return presenceDataProvider.setItem(presence);
  }

}
