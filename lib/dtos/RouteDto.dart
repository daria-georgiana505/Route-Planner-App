
class RouteDto{
  String startLocation;
  String endLocation;
  DateTime startDateTime;
  double distanceKm;
  Duration travelTime;
  bool notificationsEnabled = true;

  RouteDto({
    required this.startLocation,
    required this.endLocation,
    required this.startDateTime,
    required this.distanceKm,
    required this.travelTime
  });
  RouteDto.constructorWithNotificationsField({
    required this.startLocation,
    required this.endLocation,
    required this.startDateTime,
    required this.distanceKm,
    required this.travelTime,
    required this.notificationsEnabled
  });
}