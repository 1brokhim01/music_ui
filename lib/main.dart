import 'package:flutter/material.dart';
import 'package:home30/routes/routes.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _routes = Routes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _routes.routesFunc,
      initialRoute: "/home",
    );
  }
}
