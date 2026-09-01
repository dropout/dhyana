import 'package:core/core.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:session/src/data/datasource/faker_session_extension.dart';
import 'package:session/src/data/mapper/session_mapper.dart';
import 'package:session/src/domain/entity/session_entity.dart';
import 'package:session/src/presentation/view/completed/session_result.dart';
import 'package:session/src/presentation/view/completed/signed_out_completed_view.dart';


void main() {

  testWidgets('SignedOutCompletedView renders correctly', (WidgetTester tester) async {

    final SessionEntity session = Faker().createSessionEntity();

    await tester.pumpWidget(
      withAllContextProviders(
        SignedOutCompletedView(
          session: session.toApi(),
        )
      ),
    );

    expect(find.byType(SessionResult), findsOneWidget);
  });
}
