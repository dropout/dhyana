import 'package:dhyana/core/service/module/chanting_service.dart';
import 'package:dhyana/core/domain/entity/chant/chant.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chants_repository.dart';

class DefaultChantingService implements ChantingService {

  final ChantsRepository chantsRepository;

  DefaultChantingService({
    required this.chantsRepository,
  });
  
  @override
  Future<List<Chant>> loadChants() async {
    // Implement the logic to load chants here
    return chantsRepository.queryAll();
  }

}