import 'package:flutter/material.dart';
import 'package:navigation_and_animations/pages/animated_color_page.dart';
import 'package:navigation_and_animations/pages/home_page.dart';
import 'package:navigation_and_animations/pages/logo_page.dart';
import 'package:navigation_and_animations/routing/route_paths.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.home:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomePage(),
            transitionsBuilder: _transitionBuilder);

      case RoutePaths.logo:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => LogoPage(),
            transitionsBuilder: _transitionBuilder);

      case RoutePaths.animatedColor:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => AnimatedColorPage(),
            transitionsBuilder: _transitionBuilder);

      default:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text(
                "404",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          transitionsBuilder: _transitionBuilder,
        );
    }
  }

  static Widget _transitionBuilder(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    var curve = CurveTween(curve: Curves.easeOut);
    var tween = Tween(begin: const Offset(1, 0), end: Offset.zero).chain(curve);
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}
