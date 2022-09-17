import 'package:flutter/material.dart';
import 'package:vstore/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        "/": (context) => HomeScreen(),
      },
      initialRoute: "/",
    );
  }
}
