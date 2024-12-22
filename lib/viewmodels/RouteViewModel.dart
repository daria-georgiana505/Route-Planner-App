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
    try {
      _routes = await _repository.getAllRoutes();
    } catch (e) {
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future<void> addRoute(
      String startLocation,
      String endLocation,
      DateTime startDateTime,
      double distanceKm,
      bool notificationsEnabled
      ) async {
    try {
      RouteDto routeToAdd = RouteDto.constructorWithNotificationsField(
        startLocation: startLocation,
        endLocation: endLocation,
        startDateTime: startDateTime,
        distanceKm: distanceKm,
        notificationsEnabled: notificationsEnabled
      );
      final newRouteId = await _repository.addRoute(routeToAdd);
      final newRoute = await _repository.getRouteById(newRouteId);
      _routes.add(newRoute);
    } catch (e) {
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future<void> updateRoute(
      int routeId,
      String startLocation,
      String endLocation,
      DateTime startDateTime,
      double distanceKm,
      bool notificationsEnabled
      ) async {
    try {
      RouteDto routeToUpdate = RouteDto.constructorWithNotificationsField(
          startLocation: startLocation,
          endLocation: endLocation,
          startDateTime: startDateTime,
          distanceKm: distanceKm,
          notificationsEnabled: notificationsEnabled);
      await _repository.updateRoute(routeId, routeToUpdate);
      final updatedRoute = await _repository.getRouteById(routeId);
      final index = _routes.indexWhere((route) => route.routeId == routeId);
      if (index != -1) {
        _routes[index] = updatedRoute;
      }
    } catch (e) {
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  Future<void> deleteRoute(int routeId) async
  {
    try {
      await _repository.deleteRoute(routeId);
      _routes.removeWhere((route) => route.routeId == routeId);
    } catch (e) {
      rethrow;
    } finally {
      notifyListeners();
    }
  }
}