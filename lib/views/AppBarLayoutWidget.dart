
import 'package:flutter/material.dart';

class AppBarLayoutWidget extends StatelessWidget {
  final Widget body;
  final String title;

  const AppBarLayoutWidget({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Theme.of(context).colorScheme.surface
          ),
        ),
      ),
      body: body
    );
  }
}
