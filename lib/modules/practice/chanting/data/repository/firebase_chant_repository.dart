import 'package:dhyana/modules/practice/chanting/data/datasource/chant_data_provider.dart';
import 'package:dhyana/core/domain/entity/chant/chant.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_repository.dart';
import 'package:dhyana/core/domain/repository/crud/crud_repository_operations.dart';

class FirebaseChantRepository
    extends CrudRepositoryOps<Chant>
    implements ChantRepository {

  final ChantDataProvider chantDataProvider;

  const FirebaseChantRepository({
    required this.chantDataProvider,
  }) : super(chantDataProvider);

  @override
  Future<List<Chant>> queryAll() => chantDataProvider.queryAll();

  @override
  Stream<List<Chant>> queryAllStream() => chantDataProvider.queryAllStream();

}

