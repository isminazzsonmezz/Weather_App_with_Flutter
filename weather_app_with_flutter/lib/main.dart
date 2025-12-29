import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:weather_app_with_flutter/Pages/weather_home_page.dart';

void main(List<String> args) {
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: MyWeatherHomePage()),
      // here
      navigatorObservers: [FlutterSmartDialog.observer],
      // here
      builder: FlutterSmartDialog.init(),
    );
  }
}


