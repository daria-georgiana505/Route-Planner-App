
import 'package:drift/drift.dart';
import 'package:mobile_non_native/database/database.dart';
import 'package:mobile_non_native/dtos/RouteDto.dart';

import '../locator.dart';


class RouteRepository {
  final AppDb _db = locator<AppDb>();
  final Function(Object, StackTrace?) logError;

  RouteRepository({required this.logError});

  Future<List<RouteModelData>> getAllRoutes() async {
    try {
      return await _db.select(_db.routeModel).get();
    } catch (e, stack) {
      logError(e, stack);
      throw Exception("Failed to load routes");
    }
  }

  Future<RouteModelData> getRouteById(int routeId) async {
    try {
      return await (_db.select(_db.routeModel)
            ..where((tbl) => tbl.routeId.equals(routeId)))
          .getSingle();
    } catch (e, stack) {
      logError(e, stack);
      throw Exception("Failed to load route by ID");
    }
  }

  Future<int> addRoute(RouteDto routeDto) async {
    try {
      final route = RouteModelCompanion(
        startLocation: Value(routeDto.startLocation),
        endLocation: Value(routeDto.endLocation),
        startDateTime: Value(routeDto.startDateTime),
        distanceKm: Value(routeDto.distanceKm),
        travelTime: Value(routeDto.travelTime.inMinutes),
        notificationsEnabled: Value(routeDto.notificationsEnabled),
      );
      return await _db.into(_db.routeModel).insert(route);
    } catch (e, stack) {
      logError(e, stack);
      throw Exception("Failed to add route");
    }
  }

  Future<void> updateRoute(int routeId, RouteDto updatedRouteDto) async {
    try {
      final route = RouteModelCompanion(
        startLocation: Value(updatedRouteDto.startLocation),
        endLocation: Value(updatedRouteDto.endLocation),
        startDateTime: Value(updatedRouteDto.startDateTime),
        distanceKm: Value(updatedRouteDto.distanceKm),
        travelTime: Value(updatedRouteDto.travelTime.inMinutes),
        notificationsEnabled: Value(updatedRouteDto.notificationsEnabled),
      );
      await (_db.update(_db.routeModel)
            ..where((tbl) => tbl.routeId.equals(routeId)))
          .write(route);
    } catch (e, stack) {
      logError(e, stack);
      throw Exception("Failed to update route");
    }
  }

  Future<void> deleteRoute(int routeId) async {
    try {
      await (_db.delete(_db.routeModel)
            ..where((tbl) => tbl.routeId.equals(routeId)))
          .go();
    } catch (e, stack) {
      logError(e, stack);
      throw Exception("Failed to delete route");
    }
  }
}