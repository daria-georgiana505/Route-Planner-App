import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mobile_non_native/locator.dart';
import 'package:mobile_non_native/repositories/RouteRepository.dart';
import 'package:mobile_non_native/utils/CustomTheme.dart';
import 'package:mobile_non_native/viewmodels/RouteViewModel.dart';
import 'package:mobile_non_native/views/HomeScreenView.dart';
import 'package:provider/provider.dart';

void main() {
  setUp();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    )
  );
}

Logger logger = Logger();

void _logError(Object error, StackTrace? stack) {
  logger.e('Error: $error', error: error, stackTrace: stack);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final RouteRepository _repository = RouteRepository(logError: _logError);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RouteViewModel(_repository),
        child: MaterialApp(
        title: 'Route planner',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.darkThemeData(),
        darkTheme: CustomTheme.darkThemeData(),
          themeMode: ThemeMode.system,
          home: HomeScreenView()
      )
    );
  }
}