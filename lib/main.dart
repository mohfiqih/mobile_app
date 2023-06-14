// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobile_app/login/login.dart';
import 'package:mobile_app/splashscreen/splash.dart';
import 'package:mobile_app/dashboard/dashboard.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drowning Detection',
      home: DashboardPage(),
      builder: EasyLoading.init(),
    );
  }
}
