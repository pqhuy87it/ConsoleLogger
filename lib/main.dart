import 'package:flutter/material.dart';

import 'app_debug_logger.dart';
import 'debug_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConsoleLogger Demo',
      // Wrap your main application with DebugLogOverlay
      builder: (context, child) {
        return DebugLogOverlay(child: child!);
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    // Basic Info Log
    AppDebugLogger.instance.log("App initialized successfully.");

    // Debug Log
    AppDebugLogger.instance.log(
      "Fetching user data...",
      event: EventType.debug,
    );

    // Warning Log
    AppDebugLogger.instance.log(
      "API response is slow.",
      event: EventType.warning,
    );

    // Error Log
    AppDebugLogger.instance.log(
      "Failed to load image.",
      event: EventType.error,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Demo.'),
          ],
        ),
      ),
    );
  }
}
