import 'package:flutter/material.dart';
import 'package:mobile_non_native/repositories/RouteRepository.dart';

import '../database/database.dart';
import '../dtos/RouteDto.dart';

class RouteViewModel extends ChangeNotifier{
  final RouteRepository _repository;

  RouteViewModel(this._repository);

  List<RouteModelData> _routes = [];

  List<RouteModelData> get routes => _routes;

  Future<void> loadRoutes() async {
    _routes = await _repository.getAllRoutes();
    notifyListeners();
  }

  Future<void> addRoute(
      String startLocation,
      String endLocation,
      DateTime startDateTime,
      double distanceKm,
      Duration travelTime,
      bool notificationsEnabled
      ) async {
    RouteDto routeToAdd = RouteDto.constructorWithNotificationsField(
        startLocation: startLocation,
        endLocation: endLocation,
        startDateTime: startDateTime,
        distanceKm: distanceKm,
        travelTime: travelTime,
        notificationsEnabled: notificationsEnabled
    );
    final newRouteId = await _repository.addRoute(routeToAdd);
    final newRoute = await _repository.getRouteById(newRouteId);
    _routes.add(newRoute);
    notifyListeners();
  }

  Future<void> updateRoute(
      int routeId,
      String startLocation,
      String endLocation,
      DateTime startDateTime,
      double distanceKm,
      Duration travelTime,
      bool notificationsEnabled
      ) async {
    RouteDto routeToUpdate = RouteDto.constructorWithNotificationsField(
        startLocation: startLocation,
        endLocation: endLocation,
        startDateTime: startDateTime,
        distanceKm: distanceKm,
        travelTime: travelTime,
        notificationsEnabled: notificationsEnabled
    );
    await _repository.updateRoute(routeId, routeToUpdate);
    final updatedRoute = await _repository.getRouteById(routeId);
    final index = _routes.indexWhere((route) => route.routeId == routeId);
    if (index != -1) {
      _routes[index] = updatedRoute;
      notifyListeners();
    }
  }

  Future<void> deleteRoute(int routeId) async
  {
    await _repository.deleteRoute(routeId);
    _routes.removeWhere((route) => route.routeId == routeId);
    notifyListeners();
  }
}