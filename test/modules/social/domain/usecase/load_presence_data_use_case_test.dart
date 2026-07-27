import 'package:dhyana/core/domain/entity/presence/presence_query_options.dart';
import 'package:dhyana/modules/social/domain/usecase/load_presence_data_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mock_definitions.dart';

void main() {
  late MockPresenceRepository presenceRepository;
  late LoadPresenceDataUseCase useCase;

  setUp(() {
    presenceRepository = MockPresenceRepository();
    useCase = LoadPresenceDataUseCase(
      presenceRepository: presenceRepository,
    );
  });

  test('forwards query options to repository and returns result', () async {
    const queryOptions = PresenceQueryOptions(
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
