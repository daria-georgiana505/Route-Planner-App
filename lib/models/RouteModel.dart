
import 'package:drift/drift.dart';

class RouteModel extends Table{
  IntColumn get routeId => integer().autoIncrement()();
  TextColumn get startLocation => text()();
  TextColumn get endLocation => text()();
  DateTimeColumn get startDateTime => dateTime()();
  RealColumn get distanceKm => real()();
  BoolColumn get notificationsEnabled => boolean().withDefault(Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}