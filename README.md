# ConsoleLogger

A lightweight, visually appealing, in-app debugging console for Flutter. **ConsoleLogger** allows you to monitor, filter, and view your application's logs directly on your device's screen via a handy overlay—no IDE connection required!

## 🌟 Features

* **In-App Overlay:** View your logs in real-time inside your app using a collapsible UI.
* **Filter by Log Type:** Easily sort through `Info`, `Debug`, `Warning`, `Error`, `Verbose`, and `Severe` logs via a built-in dropdown.
* **Color-Coded & Emojis:** Quickly identify log severity with custom colors and emojis.
* **Selectable Text:** Copy log details directly from your device screen.
* **Auto-managed Memory:** Automatically keeps only the latest 200 logs to prevent memory bloat.
* **Zero Configuration:** Drop it into your app and start logging immediately.

---

## 🚀 Usage

### 1. Initialize the Overlay

Wrap your application (or your main screen) with the `DebugLogOverlay` widget. This injects the floating "bug" button and the console viewer into your app's widget tree.

```dart
import 'package:flutter/material.dart';
import 'package:your_package_name/debug_logger.dart';

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
        return DebugLogOverlay(
          child: child!,
        );
      },
      home: const MyHomePage(),
    );
  }
}

```

### 2. Add Logs

Use the singleton `AppDebugLogger.instance.log()` from anywhere in your app to record events.

```dart
import 'package:your_package_name/app_debug_logger.dart';

// Basic Info Log
AppDebugLogger.instance.log("App initialized successfully.");

// Debug Log
AppDebugLogger.instance.log("Fetching user data...", event: EventType.debug);

// Warning Log
AppDebugLogger.instance.log("API response is slow.", event: EventType.warning);

// Error Log
AppDebugLogger.instance.log("Failed to load image.", event: EventType.error);

```

### 3. Clear Logs

If you need to programmatically clear the console, simply call:

```dart
AppDebugLogger.instance.clear();

```

---

## 🎛️ Log Types

ConsoleLogger comes with 6 predefined event types to help you categorize your app's behavior:

| Event Type | Emoji | Description / Use Case |
| --- | --- | --- |
| `EventType.info` | ℹ️ | General app flow and state changes. |
| `EventType.debug` | 📍 | Diagnostic information for developers. |
| `EventType.verbose` | 🔶 | Detailed step-by-step execution tracking. |
| `EventType.warning` | ⚠️ | Unexpected behavior that isn't a fatal error. |
| `EventType.error` | ‼️ | Failures, exceptions, and API errors. |
| `EventType.severe` | 🔥 | Critical crashes or systemic failures. |

---

## 📸 How it Works

1. A small red **Bug Icon** sits unobtrusively at the bottom right of your screen.
2. Tapping it opens the **Log Console**, taking up the bottom half of the screen.
3. Use the top toolbar to **Filter** by event type, **Clear** the console, or **Close** the overlay.
