import 'package:dhyana/util/date_time_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('DateTimeUtils', () {

    test('can tell if its the same day', () {
      final today = DateTime(2023, 8, 31, 12, 0);
      final today2 = DateTime(2023, 8, 31, 0, 0);
      expect(today.isSameDay(today2), true);
    });

    test('can tell if its the previous day when its in previous month', () {
      final today = DateTime(2023, 9, 1, 12, 0);
      final yesterday = DateTime(2023, 8, 31, 0, 0);
      expect(today.isYesterday(yesterday), true);
    });

    test('can tell if its the previous day when its in previous year', () {
      final today = DateTime(2024, 1, 1);
      final yesterday = DateTime(2023, 12, 31);
      expect(today.isYesterday(yesterday), true);
    });

    test('can tell if its earlier than the previous day', () {
      final today = DateTime(2023, 9, 1, 12, 0);
      final yesterday = DateTime(2023, 8, 30, 0, 0);
      expect(today.isBeforeYesterday(yesterday), true);
    });

    test('can tell if its _NOT_ earlier than the previous day', () {
      final today = DateTime(2023, 9, 1, 9, 0);
      final targetDay = DateTime(2023, 8, 31, 0, 0);
      expect(today.isBeforeYesterday(targetDay), false);
    });

    test('can tell if its the previous day', () {
      final today = DateTime(2023, 9, 1, 1, 0);
      final targetDay = DateTime(2023, 8, 31, 0, 0);
      final earlier = DateTime(2023, 8, 20, 0, 0);
      expect(today.isYesterday(targetDay), true);
      expect(today.isYesterday(earlier), false);
    });

    test('can tell the week number', () {
      expect(DateTime(2025, 1, 3).weekNumber, 1);
      expect(DateTime(2025, 1, 13).weekNumber, 3);
      expect(DateTime(2025, 3, 31).weekNumber, 14);
      expect(DateTime(2025, 4, 7).weekNumber, 15);
    });

  });

}
