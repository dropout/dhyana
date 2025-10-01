import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/fake/fake_model_factory.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/widget/profile/profile_avatar.dart';
import 'package:dhyana/widget/session/completed/session_result.dart';
import 'package:dhyana/widget/session/completed/signed_out_completed_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
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

  testWidgets('SessionResult renders correctly', (WidgetTester tester) async {

    final Session session = FakeModelFactory().createSession();

    await tester.runAsync(() async {
      await tester.pumpWidget(
        withAllContextProviders(
          MultiProvider(
            providers: [
              Provider<Services>.value(value: mockServices),
            ],
            child: SessionResult(
              session: session,
            )
          ),
        )
      );
      await tester.pumpAndSettle();
    }).then((_) {
      expect(find.byType(ProfileAvatar), findsOneWidget);
      expect(find.byKey(const Key('session_result_completed_text')), findsOneWidget);

      RichText richText = tester.widget(find.byKey(const Key('session_result_completed_text')));
      final textSpan = richText.text as TextSpan;
      expect(textSpan.children![1].toPlainText(), equals(session.duration.inMinutes.toString()));

    });

  });
}
