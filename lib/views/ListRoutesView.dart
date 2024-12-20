
import 'package:flutter/material.dart';
import 'package:mobile_non_native/models/RouteModel.dart';
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
  Widget build(BuildContext context) {
    return Consumer<RouteViewModel>(
      builder: (context, viewModel, child) {
          final List<RouteModel> routes = viewModel.routes;

          return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: routes.length,
              itemBuilder: (BuildContext context, int index) {
                final RouteModel route = routes[index];

                return RouteView(route: route, key: ValueKey(route.routeId));
              },
          );
      },
    );
  }
}
