abstract class TimerService  {

  void start();
  void stop();
  void reset();
  void close();

  int get ticks;
  Duration get elapsedTime;
  bool get running;
  bool get finished;
  Stream<int> get tickStream;
  Stream<void> get finishedStream;

}
