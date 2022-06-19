import 'package:flutter/material.dart';
import 'package:projek_akhir/warna.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    var panjanglayar = MediaQuery.of(context).size.width;
    var tinggilayar = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: biru,
        title: Center(
            child: Text(
          "Akun",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      body: Container(
        width: panjanglayar,
        height: tinggilayar,
        color: krem,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/hiasanprofil.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/profil.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: panjanglayar / 10 * 8,
                height: 75,
                decoration: BoxDecoration(
                  color: biru,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.person,
                        size: 40,
                      ),
                      Text(
                        "Username@gmail.com",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: panjanglayar / 10 * 8,
                height: 75,
                decoration: BoxDecoration(
                  color: biru,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.person,
                        size: 40,
                      ),
                      Text(
                        "Username@gmail.com",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
