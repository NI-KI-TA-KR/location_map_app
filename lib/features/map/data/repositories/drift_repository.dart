import 'package:injectable/injectable.dart';
import 'package:test_flutter_map/features/map/data/data_source/drift/drift_location_datebase_service.dart';
import 'package:test_flutter_map/features/map/domain/repositories/location_repository.dart';

@lazySingleton
final class DBDriftLocationRepository implements LocationRepository {
  DBDriftLocationRepository(this._locationDateBaseService);

  final DriftLocationDatebaseService _locationDateBaseService;

  @override
  Future<List<LocationPointData>> getAllPoints() async {
    try {
      final points = await _locationDateBaseService.locationDao.getAllPoints();
      return points;
    } catch (_) {
      throw Exception('DataBase DRIFT Error');
    }
  }

  @override
  Future<void> insertFromJsonFile(String jsonString) async {
    try {
      await _locationDateBaseService.locationDao.insertFromJsonFile(jsonString);
    } catch (_) {
      throw Exception('DataBase DRIFT Error');
    }
  }
}
