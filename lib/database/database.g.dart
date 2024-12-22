// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $RouteModelTable extends RouteModel
    with TableInfo<$RouteModelTable, RouteModelData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteModelTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _routeIdMeta =
      const VerificationMeta('routeId');
  @override
  late final GeneratedColumn<int> routeId = GeneratedColumn<int>(
      'route_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _startLocationMeta =
      const VerificationMeta('startLocation');
  @override
  late final GeneratedColumn<String> startLocation = GeneratedColumn<String>(
      'start_location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _endLocationMeta =
      const VerificationMeta('endLocation');
  @override
  late final GeneratedColumn<String> endLocation = GeneratedColumn<String>(
      'end_location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startDateTimeMeta =
      const VerificationMeta('startDateTime');
  @override
  late final GeneratedColumn<DateTime> startDateTime =
      GeneratedColumn<DateTime>('start_date_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _distanceKmMeta =
      const VerificationMeta('distanceKm');
  @override
  late final GeneratedColumn<double> distanceKm = GeneratedColumn<double>(
      'distance_km', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _notificationsEnabledMeta =
      const VerificationMeta('notificationsEnabled');
  @override
  late final GeneratedColumn<bool> notificationsEnabled = GeneratedColumn<bool>(
      'notifications_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("notifications_enabled" IN (0, 1))'),
      defaultValue: Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        routeId,
        startLocation,
        endLocation,
        startDateTime,
        distanceKm,
        notificationsEnabled,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'route_model';
  @override
  VerificationContext validateIntegrity(Insertable<RouteModelData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('route_id')) {
      context.handle(_routeIdMeta,
          routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta));
    }
    if (data.containsKey('start_location')) {
      context.handle(
          _startLocationMeta,
          startLocation.isAcceptableOrUnknown(
              data['start_location']!, _startLocationMeta));
    } else if (isInserting) {
      context.missing(_startLocationMeta);
    }
    if (data.containsKey('end_location')) {
      context.handle(
          _endLocationMeta,
          endLocation.isAcceptableOrUnknown(
              data['end_location']!, _endLocationMeta));
    } else if (isInserting) {
      context.missing(_endLocationMeta);
    }
    if (data.containsKey('start_date_time')) {
      context.handle(
          _startDateTimeMeta,
          startDateTime.isAcceptableOrUnknown(
              data['start_date_time']!, _startDateTimeMeta));
    } else if (isInserting) {
      context.missing(_startDateTimeMeta);
    }
    if (data.containsKey('distance_km')) {
      context.handle(
          _distanceKmMeta,
          distanceKm.isAcceptableOrUnknown(
              data['distance_km']!, _distanceKmMeta));
    } else if (isInserting) {
      context.missing(_distanceKmMeta);
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
          _notificationsEnabledMeta,
          notificationsEnabled.isAcceptableOrUnknown(
              data['notifications_enabled']!, _notificationsEnabledMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {routeId};
  @override
  RouteModelData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RouteModelData(
      routeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}route_id'])!,
      startLocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}start_location'])!,
      endLocation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}end_location'])!,
      startDateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}start_date_time'])!,
      distanceKm: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}distance_km'])!,
      notificationsEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}notifications_enabled'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $RouteModelTable createAlias(String alias) {
    return $RouteModelTable(attachedDatabase, alias);
  }
}

class RouteModelData extends DataClass implements Insertable<RouteModelData> {
  final int routeId;
  final String startLocation;
  final String endLocation;
  final DateTime startDateTime;
  final double distanceKm;
  final bool notificationsEnabled;
  final DateTime createdAt;
  const RouteModelData(
      {required this.routeId,
      required this.startLocation,
      required this.endLocation,
      required this.startDateTime,
      required this.distanceKm,
      required this.notificationsEnabled,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['route_id'] = Variable<int>(routeId);
    map['start_location'] = Variable<String>(startLocation);
    map['end_location'] = Variable<String>(endLocation);
    map['start_date_time'] = Variable<DateTime>(startDateTime);
    map['distance_km'] = Variable<double>(distanceKm);
    map['notifications_enabled'] = Variable<bool>(notificationsEnabled);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RouteModelCompanion toCompanion(bool nullToAbsent) {
    return RouteModelCompanion(
      routeId: Value(routeId),
      startLocation: Value(startLocation),
      endLocation: Value(endLocation),
      startDateTime: Value(startDateTime),
      distanceKm: Value(distanceKm),
      notificationsEnabled: Value(notificationsEnabled),
      createdAt: Value(createdAt),
    );
  }

  factory RouteModelData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteModelData(
      routeId: serializer.fromJson<int>(json['routeId']),
      startLocation: serializer.fromJson<String>(json['startLocation']),
      endLocation: serializer.fromJson<String>(json['endLocation']),
      startDateTime: serializer.fromJson<DateTime>(json['startDateTime']),
      distanceKm: serializer.fromJson<double>(json['distanceKm']),
      notificationsEnabled:
          serializer.fromJson<bool>(json['notificationsEnabled']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'routeId': serializer.toJson<int>(routeId),
      'startLocation': serializer.toJson<String>(startLocation),
      'endLocation': serializer.toJson<String>(endLocation),
      'startDateTime': serializer.toJson<DateTime>(startDateTime),
      'distanceKm': serializer.toJson<double>(distanceKm),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RouteModelData copyWith(
          {int? routeId,
          String? startLocation,
          String? endLocation,
          DateTime? startDateTime,
          double? distanceKm,
          bool? notificationsEnabled,
          DateTime? createdAt}) =>
      RouteModelData(
        routeId: routeId ?? this.routeId,
        startLocation: startLocation ?? this.startLocation,
        endLocation: endLocation ?? this.endLocation,
        startDateTime: startDateTime ?? this.startDateTime,
        distanceKm: distanceKm ?? this.distanceKm,
        notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
        createdAt: createdAt ?? this.createdAt,
      );
  RouteModelData copyWithCompanion(RouteModelCompanion data) {
    return RouteModelData(
      routeId: data.routeId.present ? data.routeId.value : this.routeId,
      startLocation: data.startLocation.present
          ? data.startLocation.value
          : this.startLocation,
      endLocation:
          data.endLocation.present ? data.endLocation.value : this.endLocation,
      startDateTime: data.startDateTime.present
          ? data.startDateTime.value
          : this.startDateTime,
      distanceKm:
          data.distanceKm.present ? data.distanceKm.value : this.distanceKm,
      notificationsEnabled: data.notificationsEnabled.present
          ? data.notificationsEnabled.value
          : this.notificationsEnabled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RouteModelData(')
          ..write('routeId: $routeId, ')
          ..write('startLocation: $startLocation, ')
          ..write('endLocation: $endLocation, ')
          ..write('startDateTime: $startDateTime, ')
          ..write('distanceKm: $distanceKm, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(routeId, startLocation, endLocation,
      startDateTime, distanceKm, notificationsEnabled, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteModelData &&
          other.routeId == this.routeId &&
          other.startLocation == this.startLocation &&
          other.endLocation == this.endLocation &&
          other.startDateTime == this.startDateTime &&
          other.distanceKm == this.distanceKm &&
          other.notificationsEnabled == this.notificationsEnabled &&
          other.createdAt == this.createdAt);
}

class RouteModelCompanion extends UpdateCompanion<RouteModelData> {
  final Value<int> routeId;
  final Value<String> startLocation;
  final Value<String> endLocation;
  final Value<DateTime> startDateTime;
  final Value<double> distanceKm;
  final Value<bool> notificationsEnabled;
  final Value<DateTime> createdAt;
  const RouteModelCompanion({
    this.routeId = const Value.absent(),
    this.startLocation = const Value.absent(),
    this.endLocation = const Value.absent(),
    this.startDateTime = const Value.absent(),
    this.distanceKm = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RouteModelCompanion.insert({
    this.routeId = const Value.absent(),
    required String startLocation,
    required String endLocation,
    required DateTime startDateTime,
    required double distanceKm,
    this.notificationsEnabled = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : startLocation = Value(startLocation),
        endLocation = Value(endLocation),
        startDateTime = Value(startDateTime),
        distanceKm = Value(distanceKm);
  static Insertable<RouteModelData> custom({
    Expression<int>? routeId,
    Expression<String>? startLocation,
    Expression<String>? endLocation,
    Expression<DateTime>? startDateTime,
    Expression<double>? distanceKm,
    Expression<bool>? notificationsEnabled,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (routeId != null) 'route_id': routeId,
      if (startLocation != null) 'start_location': startLocation,
      if (endLocation != null) 'end_location': endLocation,
      if (startDateTime != null) 'start_date_time': startDateTime,
      if (distanceKm != null) 'distance_km': distanceKm,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RouteModelCompanion copyWith(
      {Value<int>? routeId,
      Value<String>? startLocation,
      Value<String>? endLocation,
      Value<DateTime>? startDateTime,
      Value<double>? distanceKm,
      Value<bool>? notificationsEnabled,
      Value<DateTime>? createdAt}) {
    return RouteModelCompanion(
      routeId: routeId ?? this.routeId,
      startLocation: startLocation ?? this.startLocation,
      endLocation: endLocation ?? this.endLocation,
      startDateTime: startDateTime ?? this.startDateTime,
      distanceKm: distanceKm ?? this.distanceKm,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (routeId.present) {
      map['route_id'] = Variable<int>(routeId.value);
    }
    if (startLocation.present) {
      map['start_location'] = Variable<String>(startLocation.value);
    }
    if (endLocation.present) {
      map['end_location'] = Variable<String>(endLocation.value);
    }
    if (startDateTime.present) {
      map['start_date_time'] = Variable<DateTime>(startDateTime.value);
    }
    if (distanceKm.present) {
      map['distance_km'] = Variable<double>(distanceKm.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] = Variable<bool>(notificationsEnabled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteModelCompanion(')
          ..write('routeId: $routeId, ')
          ..write('startLocation: $startLocation, ')
          ..write('endLocation: $endLocation, ')
          ..write('startDateTime: $startDateTime, ')
          ..write('distanceKm: $distanceKm, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $RouteModelTable routeModel = $RouteModelTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [routeModel];
}

typedef $$RouteModelTableCreateCompanionBuilder = RouteModelCompanion Function({
  Value<int> routeId,
  required String startLocation,
  required String endLocation,
  required DateTime startDateTime,
  required double distanceKm,
  Value<bool> notificationsEnabled,
  Value<DateTime> createdAt,
});
typedef $$RouteModelTableUpdateCompanionBuilder = RouteModelCompanion Function({
  Value<int> routeId,
  Value<String> startLocation,
  Value<String> endLocation,
  Value<DateTime> startDateTime,
  Value<double> distanceKm,
  Value<bool> notificationsEnabled,
  Value<DateTime> createdAt,
});

class $$RouteModelTableFilterComposer
    extends Composer<_$AppDb, $RouteModelTable> {
  $$RouteModelTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get routeId => $composableBuilder(
      column: $table.routeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get startLocation => $composableBuilder(
      column: $table.startLocation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get endLocation => $composableBuilder(
      column: $table.endLocation, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDateTime => $composableBuilder(
      column: $table.startDateTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get distanceKm => $composableBuilder(
      column: $table.distanceKm, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get notificationsEnabled => $composableBuilder(
      column: $table.notificationsEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$RouteModelTableOrderingComposer
    extends Composer<_$AppDb, $RouteModelTable> {
  $$RouteModelTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get routeId => $composableBuilder(
      column: $table.routeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get startLocation => $composableBuilder(
      column: $table.startLocation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get endLocation => $composableBuilder(
      column: $table.endLocation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDateTime => $composableBuilder(
      column: $table.startDateTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get distanceKm => $composableBuilder(
      column: $table.distanceKm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get notificationsEnabled => $composableBuilder(
      column: $table.notificationsEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$RouteModelTableAnnotationComposer
    extends Composer<_$AppDb, $RouteModelTable> {
  $$RouteModelTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get routeId =>
      $composableBuilder(column: $table.routeId, builder: (column) => column);

  GeneratedColumn<String> get startLocation => $composableBuilder(
      column: $table.startLocation, builder: (column) => column);

  GeneratedColumn<String> get endLocation => $composableBuilder(
      column: $table.endLocation, builder: (column) => column);

  GeneratedColumn<DateTime> get startDateTime => $composableBuilder(
      column: $table.startDateTime, builder: (column) => column);

  GeneratedColumn<double> get distanceKm => $composableBuilder(
      column: $table.distanceKm, builder: (column) => column);

  GeneratedColumn<bool> get notificationsEnabled => $composableBuilder(
      column: $table.notificationsEnabled, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$RouteModelTableTableManager extends RootTableManager<
    _$AppDb,
    $RouteModelTable,
    RouteModelData,
    $$RouteModelTableFilterComposer,
    $$RouteModelTableOrderingComposer,
    $$RouteModelTableAnnotationComposer,
    $$RouteModelTableCreateCompanionBuilder,
    $$RouteModelTableUpdateCompanionBuilder,
    (RouteModelData, BaseReferences<_$AppDb, $RouteModelTable, RouteModelData>),
    RouteModelData,
    PrefetchHooks Function()> {
  $$RouteModelTableTableManager(_$AppDb db, $RouteModelTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RouteModelTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RouteModelTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RouteModelTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> routeId = const Value.absent(),
            Value<String> startLocation = const Value.absent(),
            Value<String> endLocation = const Value.absent(),
            Value<DateTime> startDateTime = const Value.absent(),
            Value<double> distanceKm = const Value.absent(),
            Value<bool> notificationsEnabled = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              RouteModelCompanion(
            routeId: routeId,
            startLocation: startLocation,
            endLocation: endLocation,
            startDateTime: startDateTime,
            distanceKm: distanceKm,
            notificationsEnabled: notificationsEnabled,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> routeId = const Value.absent(),
            required String startLocation,
            required String endLocation,
            required DateTime startDateTime,
            required double distanceKm,
            Value<bool> notificationsEnabled = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              RouteModelCompanion.insert(
            routeId: routeId,
            startLocation: startLocation,
            endLocation: endLocation,
            startDateTime: startDateTime,
            distanceKm: distanceKm,
            notificationsEnabled: notificationsEnabled,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RouteModelTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $RouteModelTable,
    RouteModelData,
    $$RouteModelTableFilterComposer,
    $$RouteModelTableOrderingComposer,
    $$RouteModelTableAnnotationComposer,
    $$RouteModelTableCreateCompanionBuilder,
    $$RouteModelTableUpdateCompanionBuilder,
    (RouteModelData, BaseReferences<_$AppDb, $RouteModelTable, RouteModelData>),
    RouteModelData,
    PrefetchHooks Function()>;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$RouteModelTableTableManager get routeModel =>
      $$RouteModelTableTableManager(_db, _db.routeModel);
}
