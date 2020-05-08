import 'package:dzikir/src/ui/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'DZIKIR',
          style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
