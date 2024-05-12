import 'package:dhyana/service/all.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('DefaultTimerServiceTest', () {

    late DefaultTimerService timerService;

    tearDown(() {
      timerService.close();
    });

    test('can start timer', () async {
      timerService = DefaultTimerService(
        duration: const Duration(seconds: 3)
      );

      expect(timerService.startTime == null, true);

      timerService.start();

      expect(timerService.startTime != null, true);
      expect(timerService.running, true);
      expect(timerService.duration.inSeconds, 3);

      await expectLater(
        timerService.finishedStream,
        emits(null)
      );
    });

    test('can stop and start timer', () async {
      timerService = DefaultTimerService(
        duration: const Duration(milliseconds: 1000),
        tickIntervalInMilliSeconds: 100,
      );

      timerService.start();

      await expectLater(
        timerService.tickStream,
        emitsInOrder([1,2,3])
      );

      timerService.stop();

      expect(timerService.running, false);
      expect(timerService.ticks, 3);

      timerService.start();

      await expectLater(
        timerService.tickStream,
        emitsInOrder([4,5,6,7,8,9])
      );

      await expectLater(
        timerService.finishedStream,
        emits(null)
      );
    });

    test('can reset timer and start it again', () async {
      timerService = DefaultTimerService(
        duration: const Duration(milliseconds: 1000),
        tickIntervalInMilliSeconds: 100,
      );

      timerService.start();

      await expectLater(
        timerService.tickStream,
        emitsInOrder([1,2,3])
      );

      timerService.reset();

      expect(timerService.ticks, 0);
      expect(timerService.running, false);
      expect(timerService.startTime == null, true);

      timerService.start();
      expect(timerService.running, true);
      expect(timerService.startTime != null, true);

      await expectLater(
        timerService.tickStream,
        emitsInOrder([1,2,3,4,5,6,7,8,9])
      );

      await expectLater(
        timerService.finishedStream,
        emits(null)
      );
    });

    test('can close resources properly', () async {
      timerService = DefaultTimerService(
        duration: const Duration(milliseconds: 1000),
        tickIntervalInMilliSeconds: 100,
      );

      timerService.start();

      await expectLater(
        timerService.tickStream,
        emitsInOrder([1,2,3,4,5,6,7,8,9])
      );

      timerService.close();

      expect(timerService.running, false);

      await expectLater(
        timerService.tickStream,
        emitsDone
      );

      await expectLater(
        timerService.finishedStream,
        emitsDone
      );
    });

  });

}
