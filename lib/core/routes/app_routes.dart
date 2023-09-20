import 'package:flutter/material.dart';
import 'package:poke_demo/ui/screens/home/home_screen.dart';
import 'package:poke_demo/ui/screens/splash/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.route:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());
    }
  }
}