import 'package:flutter/foundation.dart';
import 'package:mobile_non_native/dtos/RouteDto.dart';
import 'package:mobile_non_native/models/RouteModel.dart';

class RouteRepository {
  final List<RouteModel> _routes = [
    RouteModel(
        routeId: 0,
        startLocation: 'Turda',
        endLocation: 'Cluj-Napoca',
        startDateTime: DateTime(2024, 05, 05, 17, 30),
      distanceKm: 34.4,
      travelTime: Duration(hours: 0, minutes: 35)
    ),
    RouteModel(
        routeId: 1,
        startLocation: 'Madrid',
        endLocation: 'Paris',
        startDateTime: DateTime(2024, 12, 24, 11, 50),
      distanceKm: 500,
      travelTime: Duration(days: 2, hours: 5, minutes: 55)
    )
  ];
  late int _nextId;

  RouteRepository()
  {
    _nextId = _routes.length;
  }

  List<RouteModel> getAllRoutes() => _routes;

  void addRoute(RouteDto routeDto)
  {
    RouteModel convertedRouteModel = _routeDtoToRouteModel(routeDto);
    _routes.add(convertedRouteModel);
  }

  void updateRoute(int routeId, RouteDto updatedRouteDto)
  {
    final position = _routes.indexWhere((route) => route.routeId == routeId);
    if(position != -1)
      {
        _routes[position].startLocation = updatedRouteDto.startLocation;
        _routes[position].endLocation = updatedRouteDto.endLocation;
        _routes[position].startDateTime = updatedRouteDto.startDateTime;
        _routes[position].distanceKm = updatedRouteDto.distanceKm;
        _routes[position].travelTime = updatedRouteDto.travelTime;
        _routes[position].notificationsEnabled = updatedRouteDto.notificationsEnabled;
      }
  }

  void deleteRoute(int routeId)
  {
    _routes.removeWhere((route) => route.routeId == routeId);
  }

  RouteModel _routeDtoToRouteModel(RouteDto routeDto)
  {
    return RouteModel.constructorWithNotificationsField(
        routeId: _nextId++,
        startLocation: routeDto.startLocation,
        endLocation: routeDto.endLocation,
        startDateTime: routeDto.startDateTime,
        distanceKm: routeDto.distanceKm,
        travelTime: routeDto.travelTime,
        notificationsEnabled: routeDto.notificationsEnabled
    );
  }

  RouteDto _routeModelToRouteDto(RouteModel routeModel)
  {
    return RouteDto.constructorWithNotificationsField(
        startLocation: routeModel.startLocation,
        endLocation: routeModel.endLocation,
        startDateTime: routeModel.startDateTime,
        distanceKm: routeModel.distanceKm,
        travelTime: routeModel.travelTime,
        notificationsEnabled: routeModel.notificationsEnabled
    );
  }
}