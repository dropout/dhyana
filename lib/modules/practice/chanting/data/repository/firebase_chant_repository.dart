import 'package:dhyana/modules/practice/chanting/data/datasource/chant_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chant_entity.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_repository.dart';
import 'package:dhyana/core/data/repository/crud_repository.dart';

class FirebaseChantRepository
    extends CrudRepositoryOps<ChantEntity>
    implements ChantRepository {

  final ChantDataProvider chantDataProvider;

  const FirebaseChantRepository({
    required this.chantDataProvider,
  }) : super(chantDataProvider);

  @override
  Future<List<ChantEntity>> queryAll({bool preferCache = false}) => 
    chantDataProvider.queryAll(preferCache: preferCache);

  @override
  Stream<List<ChantEntity>> queryAllStream() => chantDataProvider.queryAllStream();

}
