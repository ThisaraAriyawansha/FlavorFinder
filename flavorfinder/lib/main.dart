import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ));
  } catch (e) {
    runApp(MaterialApp(
      home: Scaffold(),
    ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlavorFinder',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // home: const HomePage(),
      home: MyHomePage(
        title: 'FlavorFinder',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
