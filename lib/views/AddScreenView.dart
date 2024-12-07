
import 'package:flutter/material.dart';
import 'package:mobile_non_native/viewmodels/RouteViewModel.dart';
import 'package:mobile_non_native/views/RouteFormView.dart';
import 'package:provider/provider.dart';

class AddScreenView extends StatefulWidget {
  const AddScreenView({super.key});

  @override
  State<AddScreenView> createState() => _AddScreenViewState();
}

class _AddScreenViewState extends State<AddScreenView> {
  @override
  Widget build(BuildContext context) {
    return RouteFormView(
      startLocation: '',
      endLocation: '',
      startDateTime: DateTime.now(),
      distanceKm: 0.0,
      travelTime: Duration.zero,
      notificationsEnabled: false,
      onSubmit: (startLocation, endLocation, startDateTime, distanceKm, travelTime, notificationsEnabled) {
        Provider.of<RouteViewModel>(context, listen: false)
            .addRoute(startLocation, endLocation, startDateTime, distanceKm, travelTime, notificationsEnabled);
      },
    );
  }
}
