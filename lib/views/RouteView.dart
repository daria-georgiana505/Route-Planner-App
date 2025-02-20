
import 'package:flutter/material.dart';
import 'package:mobile_non_native/database/database.dart';
import 'package:mobile_non_native/views/RouteFormView.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../viewmodels/RouteViewModel.dart';

class RouteView extends StatefulWidget {
  final RouteModelData route;

  const RouteView({super.key, required this.route});

  @override
  State<RouteView> createState() => _RouteViewState();
}

class _RouteViewState extends State<RouteView> {

  AlertDialog _showAlertDialog()
  {
    return AlertDialog(
      title: Text('Warning!'),
      content: Text('Are you sure you want to delete this element?'),
      backgroundColor: Theme.of(context).cardColor,
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Confirm'),
          onPressed: () async {
            try {
              await Provider.of<RouteViewModel>(context, listen: false)
                  .deleteRoute(widget.route.routeId);
              if (mounted) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Route deleted successfully')));
              }
            } catch (e) {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to delete route: $e')));
              }
            }
          },
        ),
      ],
    );
  }

  String _parseDateTimeAsString(DateTime dateTime) {
    final formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RouteFormView(
                startLocation: widget.route.startLocation,
                endLocation: widget.route.endLocation,
                startDateTime: widget.route.startDateTime,
                distanceKm: widget.route.distanceKm,
                notificationsEnabled: widget.route.notificationsEnabled,
                onSubmit: (startLocation, endLocation, startDateTime, distanceKm, notificationsEnabled) async {
                  try {
                    await Provider.of<RouteViewModel>(context, listen: false)
                        .updateRoute(
                            widget.route.routeId,
                            startLocation,
                            endLocation,
                            startDateTime,
                            distanceKm,
                            notificationsEnabled);
                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Route updated successfully')));
                    }
                  } catch (e) {
                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Failed to update route: $e')));
                    }
                  }
                },
              ),
            ),
          );
        },
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.all(10),
          shadowColor: Theme.of(context).shadowColor,
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.directions, size: 40, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        '${widget.route.startLocation} ➟ ${widget.route.endLocation}',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(color: Theme.of(context).dividerColor),
                const SizedBox(height: 10),
                Text(
                  'Start Date & Time:',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  _parseDateTimeAsString(widget.route.startDateTime),
                    style: Theme.of(context).textTheme.bodyMedium
                ),
                const SizedBox(height: 10),
                Text(
                  'Distance (KM):',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.route.distanceKm}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  'Notifications Enabled:',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.route.notificationsEnabled ? 'Yes' : 'No',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  'Created At: ${_parseDateTimeAsString(widget.route.createdAt)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).unselectedWidgetColor),
                ),
                const SizedBox(height: 10),
                Divider(color: Theme.of(context).dividerColor),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _showAlertDialog();
                        },
                      );
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                    tooltip: 'Delete Route',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
