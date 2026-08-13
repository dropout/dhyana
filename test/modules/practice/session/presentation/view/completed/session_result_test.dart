import 'package:dhyana/core/util/services.dart';
import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/practice/session/data/mapper/session_mapper.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_entity.dart';
import 'package:dhyana/modules/profile/public/view/profile_avatar.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/session_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../../../mock_definitions.dart';
import '../../../../../../test_context_providers.dart';

void main() {

  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;

  setUpAll(() async {
    mockServices = MockServices();
    mockCrashlyticsService = MockCrashlyticsService();

    when(() => mockServices.crashlyticsService)
      .thenReturn(mockCrashlyticsService);
  });

  testWidgets('SessionResult renders correctly', (WidgetTester tester) async {

    final SessionEntity session = FakeModelFactory().createSessionEntity();

    await tester.runAsync(() async {
      await tester.pumpWidget(
        withAllContextProviders(
          MultiProvider(
            providers: [
              Provider<Services>.value(value: mockServices),
            ],
            child: SessionResult(
              session: session.toApi(),
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
