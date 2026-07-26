import 'package:dhyana/core/domain/service/id_generator.dart';

class IdGeneratorService {

  final IdGenerator _idGenerator;

  IdGeneratorService(this._idGenerator);

  String sessionId() {
    return _idGenerator.sessionId();
  }

}
