import 'package:dhyana/modules/practice/chanting/domain/repository/chant_repository.dart';
import 'package:dhyana/modules/practice/chanting/public/api/chanting_public_api.dart';
import 'package:dhyana/modules/practice/chanting/public/model/chant.dart';


class DefaultChantingPublicApiService implements ChantingPublicApi {

  final ChantRepository chantRepository;

  DefaultChantingPublicApiService({
    required this.chantRepository,
  });

  @override
  Future<List<Chant>> loadChants() => chantRepository.queryAll();

  @override
  Stream<List<Chant>> get chantsStream => chantRepository.queryAllStream();

  @override
  Future<void> clearCachedChants() {
    // Implement your logic to clear cached chants here
    throw UnimplementedError();
  }
}