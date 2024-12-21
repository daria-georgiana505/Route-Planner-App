
import 'package:drift/drift.dart';
import 'package:mobile_non_native/database/database.dart';
import 'package:mobile_non_native/dtos/RouteDto.dart';

import '../locator.dart';


class RouteRepository {
  final AppDb _db = locator<AppDb>();

  RouteRepository();

  Future<List<RouteModelData>> getAllRoutes() async {
    return await _db.select(_db.routeModel).get();
  }

  Future<RouteModelData> getRouteById(int routeId) async {
    return await (_db.select(_db.routeModel)..where((tbl) => tbl.routeId.equals(routeId))).getSingle();
  }

  Future<int> addRoute(RouteDto routeDto) async {
    final route = RouteModelCompanion(
      startLocation: Value(routeDto.startLocation),
      endLocation: Value(routeDto.endLocation),
      startDateTime: Value(routeDto.startDateTime),
      distanceKm: Value(routeDto.distanceKm),
      travelTime: Value(routeDto.travelTime.inMinutes),
      notificationsEnabled: Value(routeDto.notificationsEnabled),
    );
    return await _db.into(_db.routeModel).insert(route);
  }

  Future<void> updateRoute(int routeId, RouteDto updatedRouteDto) async {
    final route = RouteModelCompanion(
      startLocation: Value(updatedRouteDto.startLocation),
      endLocation: Value(updatedRouteDto.endLocation),
      startDateTime: Value(updatedRouteDto.startDateTime),
      distanceKm: Value(updatedRouteDto.distanceKm),
      travelTime: Value(updatedRouteDto.travelTime.inMinutes),
      notificationsEnabled: Value(updatedRouteDto.notificationsEnabled),
    );
    await (_db.update(_db.routeModel)..where((tbl) => tbl.routeId.equals(routeId))).write(route);
  }

  Future<void> deleteRoute(int routeId) async {
    await (_db.delete(_db.routeModel)..where((tbl) => tbl.routeId.equals(routeId))).go();
  }
}