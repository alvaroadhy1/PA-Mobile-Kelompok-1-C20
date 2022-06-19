import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projek_akhir/Ctrl.dart';
import 'package:projek_akhir/login.dart';
import 'package:projek_akhir/warna.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final TextController textCtrl = Get.put(TextController());

  Container textFieldPassword(double panjangLayar) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Icon(
            Icons.lock,
            size: 50,
            color: coklat,
          ),
        ),
        Container(
          width: panjangLayar * 4 / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(5.0, 5.0),
                blurRadius: 5.0,
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: TextField(
            cursorColor: coklat,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: coklat,
              ),
              hintText: "Password",
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        )
      ],
    ));
  }

  Container textFieldEmail(double panjangLayar) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Icon(
            Icons.mail_outlined,
            size: 50,
            color: coklat,
          ),
        ),
        Container(
          width: panjangLayar * 4 / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(5.0, 5.0),
                blurRadius: 5.0,
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: TextField(
            controller: textCtrl.emailCtrl,
            cursorColor: coklat,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: coklat,
              ),
              hintText: "E-Mail",
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        )
      ],
    ));
  }

  Container textFieldConfirmPass(double panjangLayar) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Icon(
            Icons.lock,
            size: 50,
            color: coklat,
          ),
        ),
        Container(
          width: panjangLayar * 4 / 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(5.0, 5.0),
                blurRadius: 5.0,
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: TextField(
            controller: textCtrl.passCtrl,
            cursorColor: coklat,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: coklat,
              ),
              hintText: "Confirm Password",
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;

    var panjangLayar = MediaQuery.of(context).size.width;
    var tinggiLayar = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      width: panjangLayar,
      height: tinggiLayar,
      decoration: BoxDecoration(
          color: krem,
          image: DecorationImage(
              image: AssetImage('assets/bg1.png'), fit: BoxFit.fill)),
      child: ListView(
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Form Register',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: coklat,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          textFieldEmail(panjangLayar),
          SizedBox(
            height: 30,
          ),
          textFieldPassword(panjangLayar),
          SizedBox(
            height: 40,
          ),
          tombolLogin(_auth, textCtrl),
          SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Login(),
                ),
              );
            },
            child: Text(
              "Sudah memiliki akun? Login Disini",
              style: TextStyle(
                color: coklat,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  GestureDetector tombolLogin(_auth, textCtrl) {
    return GestureDetector(
      onTap: () async {
        try {
          UserCredential userCredential =
              await _auth.signInWithEmailAndPassword(
            email: textCtrl.emailCtrl.text,
            password: textCtrl.passCtrl.text,
          );
        } catch (e) {
          throw e;
        }
      },
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: pink,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: const Offset(5.0, 5.0),
              blurRadius: 5.0,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Register",
            style: TextStyle(
              fontSize: 19,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
