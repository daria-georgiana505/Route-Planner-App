
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
    return Consumer<RouteViewModel>(
        builder: (context, viewModel, child)
        {
          return RouteFormView(
            startLocation: '',
            endLocation: '',
            startDateTime: DateTime.now(),
            distanceKm: 0.0,
            travelTime: Duration.zero,
            notificationsEnabled: false,
            onSubmit: (startLocation, endLocation, startDateTime, distanceKm,
                travelTime, notificationsEnabled) async {
              try {
                await Provider.of<RouteViewModel>(context, listen: false).addRoute(
                  startLocation,
                  endLocation,
                  startDateTime,
                  distanceKm,
                  travelTime,
                  notificationsEnabled);
                if (context.mounted) {
                  Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Route added successfully')));
                }
              } catch (e) {
                if (context.mounted) {
                  Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to add route: $e')));
                }
              }
            },
          );
        }
    );
  }
}
