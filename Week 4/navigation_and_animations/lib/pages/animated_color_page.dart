import 'package:flutter/material.dart';

class AnimatedColorPage extends StatefulWidget {
  const AnimatedColorPage({super.key});

  @override
  State<AnimatedColorPage> createState() => _AnimatedColorPageState();
}

class _AnimatedColorPageState extends State<AnimatedColorPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  Color _color = Colors.orange;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = _controller
        .drive(ColorTween(begin: Colors.orange, end: Colors.pink));
    _controller.addListener(() {
      setState(() {
        _color = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ColoredBox(
              color: _color,
              child: SizedBox(
                height: 200,
                width: 200,
              ),
            ),
            FilledButton(
                onPressed: () {
                  _controller.reset();
                  _controller.forward();
                },
                child: Text("Change Color")),
          ],
        ),
      ),
    );
  }
}
