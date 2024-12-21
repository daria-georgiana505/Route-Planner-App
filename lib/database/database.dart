
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../models/RouteModel.dart';

part 'database.g.dart';

LazyDatabase _openConnection(){
  return LazyDatabase(() {
    return driftDatabase(name: 'my_database');
  });
}

@DriftDatabase(tables: [RouteModel])
class AppDb extends _$AppDb{
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      if (from == 1) {
        await m.deleteTable('RouteModel');

        await m.createTable(routeModel);
      }
    },
  );
}