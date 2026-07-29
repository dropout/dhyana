
abstract interface class WakelockService {

  Future<void> enable();
  Future<void> disable();
  Future<bool> isEnabled();

}
