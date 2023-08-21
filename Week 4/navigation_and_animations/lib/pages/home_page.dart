import 'package:flutter/material.dart';
import 'package:navigation_and_animations/routing/route_paths.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Hero(tag: "logo", child: FlutterLogo()),
          onPressed: () {
            Navigator.of(context).pushNamed(RoutePaths.logo);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(onPressed: () {
              Navigator.of(context).pushNamed(RoutePaths.animatedColor);
            }, child: Text("Animated Color")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: null,
        onPressed: () {
          Navigator.of(context).pushNamed("/404");
        },
        label: Text(
          "404",
        ),
      ),
    );
  }
}
