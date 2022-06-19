import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projek_akhir/Logreg.dart';
import 'package:projek_akhir/warna.dart';
import 'package:projek_akhir/LandingPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    start();
  }

  start() {
    return Timer(
        Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => Logreg()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: krem,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo-pa.png"),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Created By\nKelompok 1 C^20",
              style: TextStyle(color: biru, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            // CircularProgressIndicator(
            //   backgroundColor: Colors.black,
            //   value: 0.2,
            // ),
          ],
        ),
      ),
    );
  }
}
