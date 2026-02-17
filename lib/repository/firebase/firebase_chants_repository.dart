import 'package:dhyana/data_provider/chants_data_provider.dart';
import 'package:dhyana/model/chant.dart';
import 'package:dhyana/repository/chants_repository.dart';
import 'package:dhyana/repository/crud_repository_operations.dart';

class FirebaseChantsRepository
    extends CrudRepositoryOps<Chant>
    implements ChantsRepository {

  final ChantsDataProvider chantsDataProvider;

  const FirebaseChantsRepository({
    required this.chantsDataProvider,
  }) : super(chantsDataProvider);

  @override
  Future<List<Chant>> queryAll() => chantsDataProvider.queryAll();

  @override
  Stream<List<Chant>> queryAllStream() => chantsDataProvider.queryAllStream();

}

