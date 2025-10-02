import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/widget/profile/profile_avatar.dart';
import 'package:dhyana/widget/session/completed/milestone_progress_view_item.dart';
import 'package:dhyana/widget/session/completed/session_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:particle_field/particle_field.dart';
import 'package:provider/provider.dart';

import '../../../mock_definitions.dart';
import '../../../test_context_providers.dart';

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

  group('MilestoneProgressViewItem', () {

    testWidgets('can show incomplete item state', (WidgetTester tester) async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
              ],
              child: MilestoneProgressViewItem(
                mode: MilestoneProgressViewItemMode.incomplete,
              )
            ),
          )
        );
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('milestone_progress_view_item_incomplete')), findsOneWidget);
    });

    testWidgets('can show complete item state', (WidgetTester tester) async {
      await tester.pumpWidget(
        withAllContextProviders(
          MultiProvider(
            providers: [
              Provider<Services>.value(value: mockServices),
            ],
            child: MilestoneProgressViewItem(
              mode: MilestoneProgressViewItemMode.completed,
            )
          ),
        )
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('milestone_progress_view_item_completed')), findsOneWidget);
      expect(find.byType(CustomPaint), findsOneWidget);
    });

    testWidgets('can show animated item state', (WidgetTester tester) async {

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
              ],
              child: MilestoneProgressViewItem(
                mode: MilestoneProgressViewItemMode.animate,
              )
            ),
          )
        );
        await tester.pumpAndSettle();
      }).then((_) {
        expect(find.byKey(const Key('milestone_progress_view_item_animated')), findsOneWidget);
        expect(find.byType(ParticleField), findsOneWidget);
        expect(find.byType(CustomPaint), findsWidgets); // two CustomPaints, one for the circle, one for the particles
      });

    });


  }); // eof group
} // eof main
