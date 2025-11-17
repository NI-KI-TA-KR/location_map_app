import 'package:injectable/injectable.dart';
import 'package:test_flutter_map/features/map/data/data_source/drift/drift_location_datebase_service.dart';
import 'package:test_flutter_map/features/map/data/data_source/sqlite3/sqlite_location_database_service.dart';
import 'package:test_flutter_map/features/map/domain/repositories/location_repository.dart';

@lazySingleton
final class DBSQLiteLocationRepository implements LocationRepository {
  DBSQLiteLocationRepository(this._locationDateBaseService);

  final SqLiteLocationDatabaseService _locationDateBaseService;

  @override
  Future<List<LocationPointData>> getAllPoints() async {
    try {
      final points = _locationDateBaseService.getAllPoints();
      return points;
    } catch (_) {
      throw Exception('DataBase SQLITE Error');
    }
  }

  @override
  Future<void> insertFromJsonFile(String jsonString) async {
    try {
      await _locationDateBaseService.insertFromJson(jsonString);
    } catch (_) {
      throw Exception('DataBase SQLITE Error');
    }
  }
}
