
class RouteDto{
  String startLocation;
  String endLocation;
  DateTime startDateTime;
  double distanceKm;
  bool notificationsEnabled = true;

  RouteDto({
    required this.startLocation,
    required this.endLocation,
    required this.startDateTime,
    required this.distanceKm,
  });
  RouteDto.constructorWithNotificationsField({
    required this.startLocation,
    required this.endLocation,
    required this.startDateTime,
    required this.distanceKm,
    required this.notificationsEnabled
  });
}