import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:test_flutter_map/features/map/data/data_source/drift/location_dao.dart';
import 'package:test_flutter_map/features/map/data/models/location_point.dart';

part 'drift_location_datebase_service.g.dart';

@lazySingleton
@DriftDatabase(tables: [LocationPoint], daos: [LocationDao])
class DriftLocationDatebaseService extends _$DriftLocationDatebaseService {
  DriftLocationDatebaseService() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'location_drift.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
