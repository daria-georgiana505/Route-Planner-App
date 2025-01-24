
import 'package:flutter/material.dart';
import 'package:mobile_non_native/viewmodels/RouteViewModel.dart';
import 'package:mobile_non_native/views/RouteView.dart';
import 'package:provider/provider.dart';

class ListRoutesView extends StatefulWidget {
  const ListRoutesView({super.key});

  @override
  State<ListRoutesView> createState() => _ListRoutesViewState();
}

class _ListRoutesViewState extends State<ListRoutesView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await Provider.of<RouteViewModel>(context, listen: false).loadRoutes();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Routes loaded successfully')));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to load routes: $e')));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RouteViewModel>(
      builder: (context, viewModel, child) {
          final routes = viewModel.routes;

          return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: routes.length,
              itemBuilder: (BuildContext context, int index) {
                final route = routes[index];

                return RouteView(route: route, key: ValueKey(route.routeId));
              },
          );
      },
    );
  }
}
