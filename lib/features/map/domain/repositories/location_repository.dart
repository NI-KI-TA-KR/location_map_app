import 'package:test_flutter_map/features/map/data/data_source/drift/drift_location_datebase_service.dart';

abstract interface class LocationRepository {
  Future<List<LocationPointData>> getAllPoints();

  Future<void> insertFromJsonFile(String jsonString);
}
