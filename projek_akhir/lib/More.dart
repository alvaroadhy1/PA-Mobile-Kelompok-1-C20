import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projek_akhir/About.dart';
import 'package:projek_akhir/LandingPage.dart';
import 'package:projek_akhir/Logreg.dart';
import 'package:projek_akhir/Profil.dart';
import 'package:projek_akhir/warna.dart';

import 'formInput.dart';

class More extends StatelessWidget {
  More({Key? key}) : super(key: key);
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Future<void> logout() async {
      try {
        await _auth.signOut();
      } catch (e) {
        throw e;
      }
    }

    GestureDetector daftarMore(param1, param2, param3) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                if (param2 == "Logout") {
                  logout();
                }
                return param3;
              },
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          width: MediaQuery.of(context).size.width,
          height: 70,
          color: biru,
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              param1,
              SizedBox(
                width: 20,
              ),
              Text(
                param2,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: biru,
        title: Padding(
          padding: const EdgeInsets.only(right: 45),
          child: Center(
              child: Text(
            "More...",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
      body: Container(
        color: krem,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/logo-pa.png",
                  ),
                ),
              ),
            ),
            daftarMore(
              Icon(
                Icons.home,
                color: pink,
                size: 50,
              ),
              'Home',
              LandingPage(),
            ),
            daftarMore(
              Icon(
                Icons.question_mark_rounded,
                color: pink,
                size: 50,
              ),
              'Tentang Kita',
              About(),
            ),
            daftarMore(
              Icon(
                Icons.logout,
                color: pink,
                size: 50,
              ),
              'Logout',
              Logreg(),
            ),
          ],
        ),
      ),
    );
  }
}
