import 'package:flutter/material.dart';
import 'package:projek_akhir/login.dart';
import 'package:projek_akhir/register.dart';
import 'package:projek_akhir/warna.dart';

class Logreg extends StatefulWidget {
  const Logreg({Key? key}) : super(key: key);

  @override
  State<Logreg> createState() => _LogregState();
}

class _LogregState extends State<Logreg> {
  @override
  Widget build(BuildContext context) {
    var panjangLayar = MediaQuery.of(context).size.width;
    var tinggiLayar = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: panjangLayar,
        height: tinggiLayar,
        color: krem,
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: tinggiLayar * 2 / 3,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(1000),
                        image: DecorationImage(
                      image: AssetImage(
                        "assets/landing.png",
                      ),
                      fit: BoxFit.fitWidth,
                    )),
                    width: panjangLayar,
                    height: 150,
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(1000),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/welcome.png",
                                ),
                                fit: BoxFit.fitWidth)),
                        width: 340,
                        height: 300,
                      ),
                    ],
                  ),
                ]),
          ),
          Container(
            width: panjangLayar,
            height: tinggiLayar / 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(25),
              topEnd: Radius.circular(25),
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => Login()));
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: pink,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Register(),
                      ),
                    );
                  },
                  child: Text(
                    "Belum memiliki akun? Daftar Disini",
                    style: TextStyle(
                      color: coklat,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
