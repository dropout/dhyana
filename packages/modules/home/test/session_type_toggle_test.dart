import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:core/core.dart';
import 'package:home/src/public/enum/home_screen_view_state.dart';
import 'package:home/src/public/view/session_type_toggle.dart';


import 'home_test_helper.dart';

void main() {
  group('SessionTypeToggle', () {
    late MockServices mockServices;
    late MockHapticsService mockHapticsService;

    setUp(() {
      mockServices = MockServices();
      mockHapticsService = MockHapticsService();
      when(() => mockServices.hapticsService).thenReturn(mockHapticsService);
    });

    testWidgets('will show the correct session type toggle icon', (tester) async {
      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: HomeTestHelper.withLocalizationProvider(
            MultiBlocProvider(
              providers: [
                Provider<Services>(
                  create: (context) => mockServices,
                ),

              ],
              child: SessionTypeToggle(
                key: const ValueKey('targetWidget'),
                activeMode: .sitting,
                onModeChanged: (mode) {},
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(
        find.byKey(ValueKey(HomeScreenViewState.sitting.name)), 
        findsOneWidget
      );

      await tester.pumpWidget(
        Provider<Services>(
          create: (context) => mockServices,
          child: HomeTestHelper.withLocalizationProvider(
            MultiBlocProvider(
              providers: [
                Provider<Services>(
                  create: (context) => mockServices,
                ),

              ],
              child: SessionTypeToggle(
                key: const ValueKey('targetWidget'),
                activeMode: .chanting,
                onModeChanged: (mode) {},
              ),
            ),
          ),
        ),
      );      

      await tester.pumpAndSettle();

      expect(
        find.byKey(ValueKey(HomeScreenViewState.chanting.name)), 
        findsOneWidget
      );




    });
  });
}
