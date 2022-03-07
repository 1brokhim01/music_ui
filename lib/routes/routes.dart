import 'package:flutter/material.dart';
import 'package:home30/screens/my_home_page.dart';
import '../screens/pages/first_page.dart';
import '../screens/pages/second_page.dart';

 class Routes {
  Route? routesFunc(RouteSettings s) {
    switch (s.name) {
      case "/home":
        return MaterialPageRoute(builder: (context) => MyHomePage());
      case "/":
        return MaterialPageRoute(builder: (context) => FirstPage());
      case "//":
        return MaterialPageRoute(builder: (context) => SecondPage());
    }
  }
}
