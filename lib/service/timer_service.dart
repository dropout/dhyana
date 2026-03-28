abstract interface class TimerService {
  void start();
  void stop();
  void reset();
  void close();

  Duration get duration;
  int get ticks;
  DateTime? get startTime;
  DateTime? get endTime;
  Duration get elapsedTime;
  Duration get remainingTime;
  bool get running;
  bool get finished;

  Stream<int> get tickStream;
  void onTick(void Function(int tick) callback);

  Stream<void> get finishedStream;
  void onFinished(void Function() callback);
}
