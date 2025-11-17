// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:test_flutter_map/core/theme/theme_cubit/theme_cubit.dart'
    as _i438;
import 'package:test_flutter_map/features/map/data/data_source/drift/drift_location_datebase_service.dart'
    as _i324;
import 'package:test_flutter_map/features/map/data/data_source/drift/location_dao.dart'
    as _i132;
import 'package:test_flutter_map/features/map/data/data_source/sqlite3/sqlite_location_database_service.dart'
    as _i139;
import 'package:test_flutter_map/features/map/data/repositories/drift_repository.dart'
    as _i926;
import 'package:test_flutter_map/features/map/data/repositories/sqlite_repository.dart'
    as _i90;
import 'package:test_flutter_map/features/map/domain/bloc/map_location_cubit.dart'
    as _i897;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i438.ThemeCubit>(() => _i438.ThemeCubit());
    gh.lazySingleton<_i324.DriftLocationDatebaseService>(
      () => _i324.DriftLocationDatebaseService(),
    );
    await gh.lazySingletonAsync<_i139.SqLiteLocationDatabaseService>(
      () => _i139.SqLiteLocationDatabaseService.create(),
      preResolve: true,
    );
    gh.lazySingleton<_i926.DBDriftLocationRepository>(
      () => _i926.DBDriftLocationRepository(
        gh<_i324.DriftLocationDatebaseService>(),
      ),
    );
    gh.lazySingleton<_i90.DBSQLiteLocationRepository>(
      () => _i90.DBSQLiteLocationRepository(
        gh<_i139.SqLiteLocationDatabaseService>(),
      ),
    );
    gh.lazySingleton<_i132.LocationDao>(
      () => _i132.LocationDao(gh<_i324.DriftLocationDatebaseService>()),
    );
    gh.lazySingleton<_i897.MapLocationCubit>(
      () => _i897.MapLocationCubit(
        gh<_i926.DBDriftLocationRepository>(),
        gh<_i90.DBSQLiteLocationRepository>(),
      ),
    );
    return this;
  }
}
