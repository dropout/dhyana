import 'package:dhyana/modules/practice/chanting/data/datasource/chants_data_provider.dart';
import 'package:dhyana/core/domain/entity/chant/chant.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chants_repository.dart';
import 'package:dhyana/core/domain/repository/crud/crud_repository_operations.dart';

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

