import 'package:dhyana/data_provider/id_generator.dart';

class IdGeneratorService {

  final IdGenerator _idGenerator;

  IdGeneratorService(this._idGenerator);

  String sessionId() {
    return _idGenerator.sessionId();
  }

}
