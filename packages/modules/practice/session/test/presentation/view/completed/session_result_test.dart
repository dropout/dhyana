import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:profile/profile.dart';
import 'package:provider/provider.dart';

import 'package:core/core.dart';
import 'package:session/src/data/datasource/faker_session_extension.dart';
import 'package:session/src/data/mapper/session_mapper.dart';
import 'package:session/src/domain/entity/session_entity.dart';
import 'package:session/src/presentation/view/completed/session_result.dart';


void main() {
  late MockServices mockServices;
  late MockCrashlyticsService mockCrashlyticsService;

  setUpAll(() async {
    mockServices = MockServices();
    mockCrashlyticsService = MockCrashlyticsService();

    when(
      () => mockServices.crashlyticsService,
    ).thenReturn(mockCrashlyticsService);
  });

  testWidgets('SessionResult renders correctly', (WidgetTester tester) async {
    final SessionEntity session = Faker().createSessionEntity();

    await tester
        .runAsync(() async {
          await tester.pumpWidget(
            withAllContextProviders(
              MultiProvider(
                providers: [Provider<Services>.value(value: mockServices)],
                child: SessionResult(session: session.toApi()),
              ),
            ),
          );
          await tester.pumpAndSettle();
        })
        .then((_) {
          expect(find.byType(ProfileAvatar), findsOneWidget);
          expect(
            find.byKey(const Key('session_result_completed_text')),
            findsOneWidget,
          );

          RichText richText = tester.widget(
            find.byKey(const Key('session_result_completed_text')),
          );
          final textSpan = richText.text as TextSpan;
          expect(
            textSpan.children![1].toPlainText(),
            equals(session.duration.inMinutes.toString()),
          );
        });
  });
}
