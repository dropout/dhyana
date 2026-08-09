import 'package:dhyana/modules/practice/chanting/data/datasource/chant_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/chanting_module.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_repository.dart';
import 'package:dhyana/core/data/repository/crud_repository.dart';

class FirebaseChantRepository
    extends CrudRepositoryOps<Chant>
    implements ChantRepository {

  final ChantDataProvider chantDataProvider;

  const FirebaseChantRepository({
    required this.chantDataProvider,
  }) : super(chantDataProvider);

  @override
  Future<List<Chant>> queryAll({bool preferCache = false}) => 
    chantDataProvider.queryAll(preferCache: preferCache);

  @override
  Stream<List<Chant>> queryAllStream() => chantDataProvider.queryAllStream();

}
