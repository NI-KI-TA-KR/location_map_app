// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_location_datebase_service.dart';

// ignore_for_file: type=lint
class $LocationPointTable extends LocationPoint
    with TableInfo<$LocationPointTable, LocationPointData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationPointTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latMeta = const VerificationMeta('lat');
  @override
  late final GeneratedColumn<double> lat = GeneratedColumn<double>(
    'lat',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lngMeta = const VerificationMeta('lng');
  @override
  late final GeneratedColumn<double> lng = GeneratedColumn<double>(
    'lng',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description, lat, lng, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'location_point';
  @override
  VerificationContext validateIntegrity(
    Insertable<LocationPointData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('lat')) {
      context.handle(
        _latMeta,
        lat.isAcceptableOrUnknown(data['lat']!, _latMeta),
      );
    } else if (isInserting) {
      context.missing(_latMeta);
    }
    if (data.containsKey('lng')) {
      context.handle(
        _lngMeta,
        lng.isAcceptableOrUnknown(data['lng']!, _lngMeta),
      );
    } else if (isInserting) {
      context.missing(_lngMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocationPointData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationPointData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      lat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lat'],
      )!,
      lng: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lng'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
    );
  }

  @override
  $LocationPointTable createAlias(String alias) {
    return $LocationPointTable(attachedDatabase, alias);
  }
}

class LocationPointData extends DataClass
    implements Insertable<LocationPointData> {
  final int id;
  final String name;
  final String? description;
  final double lat;
  final double lng;
  final String type;
  const LocationPointData({
    required this.id,
    required this.name,
    this.description,
    required this.lat,
    required this.lng,
    required this.type,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['lat'] = Variable<double>(lat);
    map['lng'] = Variable<double>(lng);
    map['type'] = Variable<String>(type);
    return map;
  }

  LocationPointCompanion toCompanion(bool nullToAbsent) {
    return LocationPointCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      lat: Value(lat),
      lng: Value(lng),
      type: Value(type),
    );
  }

  factory LocationPointData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationPointData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      lat: serializer.fromJson<double>(json['lat']),
      lng: serializer.fromJson<double>(json['lng']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'lat': serializer.toJson<double>(lat),
      'lng': serializer.toJson<double>(lng),
      'type': serializer.toJson<String>(type),
    };
  }

  LocationPointData copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
    double? lat,
    double? lng,
    String? type,
  }) => LocationPointData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    type: type ?? this.type,
  );
  LocationPointData copyWithCompanion(LocationPointCompanion data) {
    return LocationPointData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      lat: data.lat.present ? data.lat.value : this.lat,
      lng: data.lng.present ? data.lng.value : this.lng,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationPointData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, lat, lng, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationPointData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.lat == this.lat &&
          other.lng == this.lng &&
          other.type == this.type);
}

class LocationPointCompanion extends UpdateCompanion<LocationPointData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<double> lat;
  final Value<double> lng;
  final Value<String> type;
  const LocationPointCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.lat = const Value.absent(),
    this.lng = const Value.absent(),
    this.type = const Value.absent(),
  });
  LocationPointCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required double lat,
    required double lng,
    required String type,
  }) : name = Value(name),
       lat = Value(lat),
       lng = Value(lng),
       type = Value(type);
  static Insertable<LocationPointData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<double>? lat,
    Expression<double>? lng,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (lat != null) 'lat': lat,
      if (lng != null) 'lng': lng,
      if (type != null) 'type': type,
    });
  }

  LocationPointCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<double>? lat,
    Value<double>? lng,
    Value<String>? type,
  }) {
    return LocationPointCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (lat.present) {
      map['lat'] = Variable<double>(lat.value);
    }
    if (lng.present) {
      map['lng'] = Variable<double>(lng.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationPointCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('lat: $lat, ')
          ..write('lng: $lng, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftLocationDatebaseService extends GeneratedDatabase {
  _$DriftLocationDatebaseService(QueryExecutor e) : super(e);
  $DriftLocationDatebaseServiceManager get managers =>
      $DriftLocationDatebaseServiceManager(this);
  late final $LocationPointTable locationPoint = $LocationPointTable(this);
  late final LocationDao locationDao = LocationDao(
    this as DriftLocationDatebaseService,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [locationPoint];
}

typedef $$LocationPointTableCreateCompanionBuilder =
    LocationPointCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
      required double lat,
      required double lng,
      required String type,
    });
typedef $$LocationPointTableUpdateCompanionBuilder =
    LocationPointCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
      Value<double> lat,
      Value<double> lng,
      Value<String> type,
    });

class $$LocationPointTableFilterComposer
    extends Composer<_$DriftLocationDatebaseService, $LocationPointTable> {
  $$LocationPointTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LocationPointTableOrderingComposer
    extends Composer<_$DriftLocationDatebaseService, $LocationPointTable> {
  $$LocationPointTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lat => $composableBuilder(
    column: $table.lat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lng => $composableBuilder(
    column: $table.lng,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LocationPointTableAnnotationComposer
    extends Composer<_$DriftLocationDatebaseService, $LocationPointTable> {
  $$LocationPointTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get lat =>
      $composableBuilder(column: $table.lat, builder: (column) => column);

  GeneratedColumn<double> get lng =>
      $composableBuilder(column: $table.lng, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);
}

class $$LocationPointTableTableManager
    extends
        RootTableManager<
          _$DriftLocationDatebaseService,
          $LocationPointTable,
          LocationPointData,
          $$LocationPointTableFilterComposer,
          $$LocationPointTableOrderingComposer,
          $$LocationPointTableAnnotationComposer,
          $$LocationPointTableCreateCompanionBuilder,
          $$LocationPointTableUpdateCompanionBuilder,
          (
            LocationPointData,
            BaseReferences<
              _$DriftLocationDatebaseService,
              $LocationPointTable,
              LocationPointData
            >,
          ),
          LocationPointData,
          PrefetchHooks Function()
        > {
  $$LocationPointTableTableManager(
    _$DriftLocationDatebaseService db,
    $LocationPointTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocationPointTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocationPointTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocationPointTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<double> lat = const Value.absent(),
                Value<double> lng = const Value.absent(),
                Value<String> type = const Value.absent(),
              }) => LocationPointCompanion(
                id: id,
                name: name,
                description: description,
                lat: lat,
                lng: lng,
                type: type,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                required double lat,
                required double lng,
                required String type,
              }) => LocationPointCompanion.insert(
                id: id,
                name: name,
                description: description,
                lat: lat,
                lng: lng,
                type: type,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LocationPointTableProcessedTableManager =
    ProcessedTableManager<
      _$DriftLocationDatebaseService,
      $LocationPointTable,
      LocationPointData,
      $$LocationPointTableFilterComposer,
      $$LocationPointTableOrderingComposer,
      $$LocationPointTableAnnotationComposer,
      $$LocationPointTableCreateCompanionBuilder,
      $$LocationPointTableUpdateCompanionBuilder,
      (
        LocationPointData,
        BaseReferences<
          _$DriftLocationDatebaseService,
          $LocationPointTable,
          LocationPointData
        >,
      ),
      LocationPointData,
      PrefetchHooks Function()
    >;

class $DriftLocationDatebaseServiceManager {
  final _$DriftLocationDatebaseService _db;
  $DriftLocationDatebaseServiceManager(this._db);
  $$LocationPointTableTableManager get locationPoint =>
      $$LocationPointTableTableManager(_db, _db.locationPoint);
}
