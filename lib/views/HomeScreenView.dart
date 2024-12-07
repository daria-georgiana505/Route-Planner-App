
import 'package:flutter/material.dart';
import 'package:mobile_non_native/views/AddScreenView.dart';
import 'package:mobile_non_native/views/AppBarLayoutWidget.dart';
import 'package:mobile_non_native/views/ListRoutesView.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarLayoutWidget(
      title: 'Route Planner',
      body: Stack(
        children: [
          ListRoutesView(),
          Positioned(
            bottom: 10,
              right: 10,
              child: FloatingActionButton(
                onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddScreenView(),
                  ),
                );
                },
                child: const Icon(Icons.add),
            )
          )
        ],
      )
    );
  }
}

