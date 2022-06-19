import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projek_akhir/LandingPage.dart';
import 'package:projek_akhir/Logreg.dart';
import 'package:projek_akhir/More.dart';
import 'package:projek_akhir/Profil.dart';
import 'package:projek_akhir/login.dart';
import 'package:projek_akhir/splash.dart';
import 'package:projek_akhir/register.dart';
import 'package:projek_akhir/formInput.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projek Akhir',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}
