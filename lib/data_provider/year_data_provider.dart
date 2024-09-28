import 'package:dhyana/model/all.dart';

abstract interface class YearDataProvider {

  Future<List<Year>> query(YearQueryOptions queryOptions);
  Stream<List<Year>> queryStream(YearQueryOptions queryOptions);

}
