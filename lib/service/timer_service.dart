abstract interface class TimerService  {

  void start();
  void stop();
  void reset();
  void close();

  Duration get duration;
  int get ticks;
  DateTime? get startTime;
  DateTime? get endTime;
  Duration get elapsedTime;
  bool get running;
  bool get finished;
  Stream<int> get tickStream;
  Stream<void> get finishedStream;

}
