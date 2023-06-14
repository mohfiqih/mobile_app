import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:async';

import 'package:mobile_app/login/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return LoginPage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300),
            Center(
              child: Image(
                image: AssetImage('assets/images/splash.png'),
                height: 250.0,
                width: 250.0,
              ),
            ),
            SizedBox(height: 150),
            Center(
              child: Image(
                image: AssetImage('assets/images/loading.gif'),
                height: 110.0,
                width: 110.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
