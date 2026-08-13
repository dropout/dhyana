import 'package:dhyana/modules/social/domain/entity/presence_query_options_entity.dart';
import 'package:dhyana/modules/social/domain/usecase/query_presence_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock_definitions.dart';

void main() {
  late MockPresenceRepository presenceRepository;
  late QueryPresenceUseCase useCase;

  setUp(() {
    presenceRepository = MockPresenceRepository();
    useCase = QueryPresenceUseCase(
      presenceRepository: presenceRepository,
    );
  });

  test('forwards query options to repository and returns result', () async {
    const queryOptions = PresenceQueryOptionsEntity(
      ownProfileId: 'me',
      lastDocumentId: 'last-doc',
      limit: 5,
      rangeInKm: 42,
      windowSize: Duration(minutes: 90),
    );

    when(() => presenceRepository.query(queryOptions))
        .thenAnswer((_) async => const []);

    final result = await useCase.execute(queryOptions);

    expect(result, isEmpty);
    verify(() => presenceRepository.query(queryOptions)).called(1);
    verifyNoMoreInteractions(presenceRepository);
  });
}
