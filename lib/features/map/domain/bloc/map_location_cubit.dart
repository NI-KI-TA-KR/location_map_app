import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:test_flutter_map/features/map/data/data_source/drift/drift_location_datebase_service.dart';
import 'package:test_flutter_map/features/map/data/repositories/drift_repository.dart';
import 'package:test_flutter_map/features/map/data/repositories/sqlite_repository.dart';
import 'package:test_flutter_map/features/map/domain/repositories/location_repository.dart';

part 'map_location_state.dart';

enum TypeDB { drift, sqlite }

@lazySingleton
class MapLocationCubit extends Cubit<MapLocationState> {
  final DBDriftLocationRepository _driftRepository;
  final DBSQLiteLocationRepository _sqliteRepository;

  static TypeDB type = TypeDB.drift;
  LocationRepository get _repository => type == TypeDB.drift ? _driftRepository : _sqliteRepository;
  bool get isDrift => type == TypeDB.drift;

  static const String _jsonPath = 'assets/json/location.json';

  MapLocationCubit(this._driftRepository, this._sqliteRepository) : super(MapLocationLoading()) {
    importFromJson();
  }

  Future<void> loadPoints() async {
    emit(MapLocationLoading());
    try {
      final points = await _repository.getAllPoints();
      await Future.delayed(Duration(seconds: 2));
      emit(MapLocationLoaded(points));
    } catch (e) {
      emit(MapLocationError());
    }
  }

  Future<void> importFromJson() async {
    emit(MapLocationLoading());
    try {
      final jsonString = await rootBundle.loadString(_jsonPath);
      await _repository.insertFromJsonFile(jsonString);
      await loadPoints();
    } catch (error) {
      emit(MapLocationError());
    }
  }

  Future<void> setDateBase(TypeDB typeDB) async {
    type = typeDB;
    await importFromJson();
  }
}
