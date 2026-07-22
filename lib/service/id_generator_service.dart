import 'package:dhyana/core/data/id_generator.dart';

class IdGeneratorService {

  final IdGenerator _idGenerator;

  IdGeneratorService(this._idGenerator);

  String sessionId() {
    return _idGenerator.sessionId();
  }

}
