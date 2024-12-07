import 'package:flutter/material.dart';
import 'package:mobile_non_native/models/RouteModel.dart';
import 'package:mobile_non_native/repositories/RouteRepository.dart';

import '../dtos/RouteDto.dart';

class RouteViewModel extends ChangeNotifier{
  final RouteRepository _repository;

  RouteViewModel(this._repository);

  List<RouteModel> get routes => _repository.getAllRoutes();

  void addRoute(
      String startLocation,
      String endLocation,
      DateTime startDateTime,
      double distanceKm,
      Duration travelTime,
      bool notificationsEnabled
      ) {
    RouteDto routeToAdd = RouteDto.constructorWithNotificationsField(
        startLocation: startLocation,
        endLocation: endLocation,
        startDateTime: startDateTime,
        distanceKm: distanceKm,
        travelTime: travelTime,
        notificationsEnabled: notificationsEnabled
    );
    _repository.addRoute(routeToAdd);
    notifyListeners();
  }

  void updateRoute(
      int routeId,
      String startLocation,
      String endLocation,
      DateTime startDateTime,
      double distanceKm,
      Duration travelTime,
      bool notificationsEnabled
      ) {
    RouteDto routeToUpdate = RouteDto.constructorWithNotificationsField(
        startLocation: startLocation,
        endLocation: endLocation,
        startDateTime: startDateTime,
        distanceKm: distanceKm,
        travelTime: travelTime,
        notificationsEnabled: notificationsEnabled
    );
    _repository.updateRoute(routeId, routeToUpdate);
    notifyListeners();
  }

  void deleteRoute(int routeId)
  {
    _repository.deleteRoute(routeId);
    notifyListeners();
  }
}