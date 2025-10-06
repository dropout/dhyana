import 'package:dhyana/widget/session/completed/progress_summary_item.dart';
import 'package:flip_board/flip_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock_definitions.dart';
import '../../../test_context_providers.dart';

// Helper to get the Type of a generic class
// This is to make a generic widget class work with find.byType
Type typeOf<T>() => T;

void main() {

  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;
  late MockCacheManagerService mockCacheManagerService;

  setUpAll(() async {

    mockServices = MockServices();

    mockCrashlyticsService = MockCrashlyticsService();
    mockCacheManagerService = MockCacheManagerService();

    when(() => mockServices.crashlyticsService)
      .thenReturn(mockCrashlyticsService);

    when(() => mockServices.cacheManagerService)
      .thenReturn(mockCacheManagerService);
    when(() => mockCacheManagerService.cacheManager)
      .thenReturn(MockCacheManager());

  });

  group('ProgressSummaryItem', () {

    testWidgets('can be created with its default values', (WidgetTester tester) async {
      await tester.pumpWidget(
        withAllContextProviders(
          ProgressSummaryItem(
            oldValue: 0,
            newValue: 10,
            label: 'Test Label',
          ),
        )
      );
      await tester.pump(Durations.long1);

      // Use the helper to find the generic type, otherwise it won't find it
      // by it's simply written type definition
      expect(find.byType(typeOf<FlipWidget<String>>()), findsOneWidget);

      expect(find.byKey(const Key('progress_summary_item_diff_indicator')), findsOne);

      // FlipWidget renders 2 items of the itemBuild function result
      expect(find.text('0'), findsExactly(2));

      await tester.pumpAndSettle(Duration(seconds: 5));

      expect(find.text('10'), findsExactly(2));
      expect(find.text('Test label'.toUpperCase()), findsOne);
    });

  }); // eof group
} // eof main
