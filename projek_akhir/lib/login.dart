import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projek_akhir/LandingPage.dart';
import 'package:projek_akhir/register.dart';
import 'package:projek_akhir/warna.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  static final snackbar = SnackBar(
    content: Text(
      "Username atau Password Salah!",
    ),
    duration: Duration(seconds: 3),
    backgroundColor: pink,
  );
  static final snackbarSukses = SnackBar(
    content: Text(
      "Login Berhasil!",
    ),
    duration: Duration(seconds: 3),
    backgroundColor: biru,
  );

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

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
            controller: _passController,
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
            controller: _emailController,
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

  Container tombolLogin(context) {
    return Container(
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (_) => LandingPage()));
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
          "Login",
          style: TextStyle(
            fontSize: 19,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var panjangLayar = MediaQuery.of(context).size.width;
    var tinggiLayar = MediaQuery.of(context).size.height;

    Future<void> signIn() async {
      try {
        FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text, password: _passController.text);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => LandingPage()));
        ScaffoldMessenger.of(context).showSnackBar(snackbarSukses);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }

    return Scaffold(
        body: Container(
      width: panjangLayar,
      height: tinggiLayar,
      decoration: BoxDecoration(
        color: krem,
        image: DecorationImage(
            image: AssetImage('assets/bg1.png'), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome Back',
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
          GestureDetector(
            onTap: () {
              signIn();
            },
            child: tombolLogin(context),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    ));
  }
}
