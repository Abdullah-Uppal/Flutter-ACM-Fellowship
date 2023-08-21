import 'package:flutter/material.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage>
    with SingleTickerProviderStateMixin {
  var size = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Hero(
                tag: "logo",
                child: AnimatedContainer(
                  curve: Curves.easeOutCubic,
                  duration: const Duration(milliseconds: 500),
                  child: FlutterLogo(),
                  height: size.toDouble(),
                  width: size.toDouble(),
                )),
            FilledButton(
              onPressed: () {
                if (size == 200) {
                  setState(() {
                    size = 100;
                  });
                  Future.delayed(Duration(milliseconds: 500), () {
                    setState(() {
                      size = 200;
                    });
                  });
                  return;
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Bounce"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
