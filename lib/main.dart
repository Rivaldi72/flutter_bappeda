import 'package:flutter/material.dart';
import 'package:bappeda_app/pages/about_screen.dart';
import 'package:bappeda_app/pages/patient_detail_screen.dart';
import 'package:bappeda_app/pages/patient_list_screen.dart';
import 'package:bappeda_app/pages/splash_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/patient-list': (context) => const PatientListScreen(),
        '/patient-detail': (context) => const PatientDetailScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
