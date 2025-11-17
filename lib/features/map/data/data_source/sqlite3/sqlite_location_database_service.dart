import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:test_flutter_map/features/map/data/data_source/drift/drift_location_datebase_service.dart';

@lazySingleton
@preResolve
class SqLiteLocationDatabaseService {
  late final Database db;

  SqLiteLocationDatabaseService._create(this.db);

  @factoryMethod
  static Future<SqLiteLocationDatabaseService> create() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'location_sqlite3.sqlite');
    final db = sqlite3.open(path);

    db.execute('''
      CREATE TABLE IF NOT EXISTS location_point (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT,
        lat REAL NOT NULL,
        lng REAL NOT NULL,
        type TEXT NOT NULL
      )
    ''');

    return SqLiteLocationDatabaseService._create(db);
  }

  Future<void> insertFromJson(String jsonString) async {
    final ResultSet countResult = db.select('SELECT COUNT(*) AS count FROM location_point');
    final int count = countResult.first['count'] as int;

    if (count > 0) {
      return;
    }

    final List<dynamic> data = jsonDecode(jsonString);

    db.execute('BEGIN TRANSACTION');

    try {
      final stmt = db.prepare('''
      INSERT INTO location_point (name, description, lat, lng, type)
      VALUES (?, ?, ?, ?, ?)
    ''');

      for (var item in data) {
        stmt.execute([item['name'], item['description'], item['lat'], item['lng'], item['type']]);
      }

      stmt.dispose();
      db.execute('COMMIT');
    } catch (e) {
      db.execute('ROLLBACK');
      rethrow;
    }
  }

  List<LocationPointData> getAllPoints() {
    final ResultSet result = db.select('SELECT * FROM location_point');
    return result
        .map(
          (row) => LocationPointData.fromJson({
            'id': row['id'],
            'name': row['name'],
            'description': row['description'],
            'lat': row['lat'],
            'lng': row['lng'],
            'type': row['type'],
          }),
        )
        .toList();
  }

  void close() {
    db.dispose();
  }
}
