import 'package:flutter/material.dart';
import 'package:news_app/screens/homescreen.dart';
import 'package:news_app/settings/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route :(context) =>  HomeScreen(),
      },
    );
  }
}

