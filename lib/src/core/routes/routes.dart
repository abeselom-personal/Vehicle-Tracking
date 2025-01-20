import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/screens/auth_screen.dart';
import '../../features/dashboard/presentation/screens/home_screen.dart';

class Routes {
  static const String home = "/";
  static const String auth = "/auth";
  static String currentRoute = auth;

  static Route<dynamic> onGenerateRouted(RouteSettings routeSettings) {
    currentRoute = routeSettings.name ?? "";
    if (kDebugMode) {
      print("Route: $currentRoute");
    }
    switch (routeSettings.name) {
      case home:
        {
          return HomeScreen.route(routeSettings);
        }
      case auth:
        {
          return AuthScreen.route(routeSettings);
        }
      default:
        {
          return MaterialPageRoute(builder: (context) => const Scaffold());
        }
    }
  }
}
