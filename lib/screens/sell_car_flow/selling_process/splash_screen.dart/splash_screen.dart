import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    _animationController.forward().whenComplete(() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Opacity(
              opacity: _animation.value,
              child: Column(
                children: [
                  SizedBox(height: 200),
                  Transform.scale(
                    scale: _animation.value,
                    child: const Icon(
                      Icons.check,
                      color: Color(0xff100049),
                      size: 100,
                    ),
                  ),
                  Text(
                    "Car Details uploaded successfully",
                    style: AppFonts.w500black14,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
