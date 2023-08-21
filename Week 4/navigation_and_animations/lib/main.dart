import 'package:flutter/material.dart';
import 'package:navigation_and_animations/routing/route_paths.dart';
import 'package:navigation_and_animations/routing/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nav & Anim',
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePaths.home,
      onGenerateRoute: CustomRouter.generateRoute,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
