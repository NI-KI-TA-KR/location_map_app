import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:test_flutter_map/features/map/data/data_source/drift/drift_location_datebase_service.dart';
import 'package:test_flutter_map/features/map/data/models/location_point.dart';

part 'location_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [LocationPoint])
class LocationDao extends DatabaseAccessor<DriftLocationDatebaseService> with _$LocationDaoMixin {
  LocationDao(super.db);

  Future<int> insertPoint(LocationPointCompanion entry) {
    return into(locationPoint).insert(entry);
  }

  Future<void> insertFromJsonFile(String jsonString) async {
    final countQuery = await (select(locationPoint).get());
    if (countQuery.isNotEmpty) {
      return;
    }

    final List<dynamic> data = jsonDecode(jsonString);

    for (var item in data) {
      await into(locationPoint).insert(
        LocationPointCompanion.insert(
          name: item['name'],
          description: Value(item['description']),
          lat: item['lat'],
          lng: item['lng'],
          type: item['type'],
        ),
      );
    }
  }

  Future<List<LocationPointData>> getAllPoints() {
    return select(locationPoint).get();
  }
}
