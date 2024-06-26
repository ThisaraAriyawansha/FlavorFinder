import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode, // Enable device preview only in debug mode
    builder: (context) => const MyApp(), // Wrap your app with DevicePreview
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlavorFinder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(), // Use HomeScreen as the initial screen
      builder: DevicePreview
          .appBuilder, // Add this line if you want to use DevicePreview
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlavorFinder'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              HomeScreen();
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Home Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
