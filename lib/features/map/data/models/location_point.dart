import 'package:drift/drift.dart';

class LocationPoint extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  RealColumn get lat => real()();
  RealColumn get lng => real()();
  TextColumn get type => text()();
}
