import 'package:dhyana/core/util/fake_model_factory.dart';
import 'package:dhyana/modules/practice/session/public/model/session.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/session_result.dart';
import 'package:dhyana/modules/practice/session/presentation/view/completed/signed_out_completed_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_context_providers.dart';

void main() {

  testWidgets('SignedOutCompletedView renders correctly', (WidgetTester tester) async {

    final Session session = FakeModelFactory().createSession();

    await tester.pumpWidget(
      withAllContextProviders(
        SignedOutCompletedView(
          session: session,
        )
      ),
    );

    expect(find.byType(SessionResult), findsOneWidget);
  });
}
