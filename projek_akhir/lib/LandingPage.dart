import 'package:flutter/material.dart';
import 'package:projek_akhir/Logreg.dart';
import 'package:projek_akhir/More.dart';
import 'package:projek_akhir/Pendapatan.dart';
import 'package:projek_akhir/Pengeluaran.dart';
import 'package:projek_akhir/formInput.dart';
import 'package:projek_akhir/login.dart';
import 'package:projek_akhir/warna.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var panjangLayar = MediaQuery.of(context).size.width;
    var tinggiLayar = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Center(child: Text("Landing Page")),
        ),
        backgroundColor: biru,
      ),
      drawer: Drawer(
        backgroundColor: krem,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: krem,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/logo-pa.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Form Input",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              tileColor: biru,
              leading: Icon(
                Icons.receipt_outlined,
                color: pink,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return FormPage();
                }));
              },
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Text(
                "Daftar Transaksi Pendapatan",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              tileColor: biru,
              leading: Icon(
                Icons.receipt_long_outlined,
                color: pink,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Pendapatan();
                }));
              },
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Text(
                "Daftar Transaksi Pengeluaran",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              tileColor: biru,
              leading: Icon(
                Icons.receipt_long_outlined,
                color: pink,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Pengeluaran();
                }));
              },
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Text(
                "More",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              tileColor: biru,
              leading: Icon(
                Icons.more_horiz,
                color: pink,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return More();
                }));
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: panjangLayar,
        height: tinggiLayar,
        color: krem,
        child: ListView(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: tinggiLayar * 2 / 3 - 85,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                color: biru,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(25),
                  topEnd: Radius.circular(25),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Money Manager Adalah\nAplikasi yang dioptimalkan\nUntuk Manajemen Akun Pribadi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    // shadows: <Shadow>[
                    //   Shadow(
                    //     offset: Offset(1.0, 1.0),
                    //     blurRadius: 1.0,
                    //     color: Color.fromARGB(255, 255, 255, 255),
                    //   ),
                    // ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => FormPage()));
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "Mulai Tambah Data!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      width: 225,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: pink,
                      ),
                    )),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
