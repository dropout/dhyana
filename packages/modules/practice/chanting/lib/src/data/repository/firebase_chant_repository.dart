import 'package:chanting/src/data/datasource/chant_data_provider.dart';
import 'package:chanting/src/domain/entity/chant_entity.dart';
import 'package:chanting/src/domain/repository/chant_repository.dart';
import 'package:core/core.dart';

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
