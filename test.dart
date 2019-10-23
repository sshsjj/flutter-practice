import 'dart:math';
import 'package:flutter_web/material.dart';
import 'package:flutter_web_ui/ui.dart' as ui;


//just for testing
void main() async {
  await ui.webOnlyInitializePlatform();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 4 * pi)
      .animate(CurvedAnimation(
        curve: Curves.easeInOut,
        parent: controller,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        controller
          ..reset()
          ..forward();
      }),
      child: SizedBox.expand(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.rotate(
              angle: animation.value,
              child: child,
            );
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: FlutterLogo(),
              ),
              Center(
                child: Text(
                  'Click me!',
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
