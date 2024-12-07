
class RouteModel{
  int routeId;
  String startLocation;
  String endLocation;
  DateTime startDateTime;
  double distanceKm;
  Duration travelTime;
  bool notificationsEnabled = true;
  DateTime createdAt = DateTime.timestamp();

  RouteModel({required this.routeId, required this.startLocation, required this.endLocation, required this.startDateTime, required this.distanceKm, required this.travelTime});
  RouteModel.constructorWithNotificationsField({required this.routeId, required this.startLocation, required this.endLocation, required this.startDateTime, required this.distanceKm, required this.travelTime, required this.notificationsEnabled});
}