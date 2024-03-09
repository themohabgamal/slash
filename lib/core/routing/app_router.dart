import 'package:flutter/material.dart';
import 'package:slash/core/routing/routes.dart';
import 'package:slash/features/home/ui/screens/details_screen.dart';
import 'package:slash/features/home/ui/screens/initial_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // If Initial Screen
      case Routes.initial:
        return MaterialPageRoute(
          builder: (context) => InitialScreen(),
        );
      // If Details Screen
      case Routes.details:
        return MaterialPageRoute(
          builder: (context) => const DetailsScreen(),
        );
      // If None Of the above screens
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("No Route Found"),
            ),
          ),
        );
    }
  }
}
