import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/widget/profile/profile_avatar.dart';
import 'package:dhyana/widget/session/completed/milestone_progress_view.dart';
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

  group('MilestoneProgressView', () {

    testWidgets('can be created with its default parameters', (WidgetTester tester) async {
      final Profile profile = FakeModelFactory().createProfile();

      await tester.pumpWidget(
        withAllContextProviders(
          MultiProvider(
            providers: [
              Provider<Services>.value(value: mockServices),
            ],
            child: MilestoneProgressView(
              profile: profile,
            )
          ),
        )
      );
      await tester.pumpAndSettle();

      final items = tester.widgetList(find.byType(MilestoneProgressViewItem));
      List<MilestoneProgressViewItem> milestoneItems = items.map((e) => e as MilestoneProgressViewItem).toList();

      expect(find.byKey(const Key('milestone_progress_view_text')), findsOneWidget);
      expect(milestoneItems.length, 7);
      milestoneItems.asMap().forEach((index, item) {
        expect(item.mode, MilestoneProgressViewItemMode.incomplete);
      });
      expect(find.byKey(const Key('milestone_progress_view_text')), findsOneWidget);
    });

    testWidgets('can hide text if parameter is given', (WidgetTester tester) async {
      final Profile profile = FakeModelFactory().createProfile();

      await tester.pumpWidget(
        withAllContextProviders(
          MultiProvider(
            providers: [
              Provider<Services>.value(value: mockServices),
            ],
            child: MilestoneProgressView(
              showText: false,
              profile: profile,
            )
          ),
        )
      );
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('milestone_progress_view_text')), findsNothing);
    });

    testWidgets('can show animation if parameter is given', (WidgetTester tester) async {
      Profile profile = FakeModelFactory().createProfile();

      profile = profile.copyWith(
        statsReport: profile.statsReport.copyWith(
          milestoneProgress: profile.statsReport.milestoneProgress.copyWith(
            targetDaysCount: 7,
            completedDaysCount: 3
          )
        )
      );

      await tester.runAsync(() async {
        await tester.pumpWidget(
          withAllContextProviders(
            MultiProvider(
              providers: [
                Provider<Services>.value(value: mockServices),
              ],
              child: MilestoneProgressView(
                showAnimation: true,
                profile: profile,
              )
            ),
          )
        );
        await tester.pumpAndSettle();
      }).then((_) {
        final items = tester.widgetList(find.byType(MilestoneProgressViewItem));
        List<MilestoneProgressViewItem> milestoneItems = items.map((e) => e as MilestoneProgressViewItem).toList();

        expect(milestoneItems.length, 7);
        expect(milestoneItems[2].mode, MilestoneProgressViewItemMode.animate);

      });

    });


  }); // eof group
} // eof main
