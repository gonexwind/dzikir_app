import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/ui/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dzikir App',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
