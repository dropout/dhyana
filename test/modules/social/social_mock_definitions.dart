import 'package:dhyana/modules/social/data/datasource/presence_data_provider.dart';
import 'package:dhyana/modules/social/domain/repository/presence_repository.dart';
import 'package:dhyana/modules/social/domain/usecase/query_presence_use_case.dart';
import 'package:dhyana/modules/social/public/viewmodel/presence_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockPresenceDataProvider 
  extends Mock 
  implements PresenceDataProvider {}

class MockPresenceCubit 
  extends Mock 
  implements PresenceCubit {}

class MockPresenceRepository 
  extends Mock 
  implements PresenceRepository {}

class MockQueryPresenceUseCase
  extends Mock
  implements QueryPresenceUseCase {}
  