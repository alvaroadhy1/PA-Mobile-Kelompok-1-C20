import 'package:flutter/material.dart';
import 'package:projek_akhir/warna.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    var panjangLayar = MediaQuery.of(context).size.width;
    var tinggiLayar = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: biru,
        title: Padding(
          padding: const EdgeInsets.only(right: 45),
          child: Center(
              child: Text(
            " Tentang Kami",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
      body: Container(
        width: panjangLayar,
        height: tinggiLayar,
        color: krem,
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: tinggiLayar * 1 / 3,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 14,
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
                                    "assets/logo-pa.png",
                                  ),
                                  fit: BoxFit.fitWidth)),
                          width: 200,
                          height: 200,
                        ),
                      ],
                    ),
                  ]),
            ),
            Container(
              width: panjangLayar,
              height: tinggiLayar * 2 / 3 - 55,
              decoration: BoxDecoration(
                  color: biru,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(25),
                    topEnd: Radius.circular(25),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      "\nAplikasi keuangan adalah program yang digunakan untuk mengatur keuangan, baik untuk keperluan pribadi, bisnis, instansi, ataupun perusahaan sehingga proses perhitungan keuangan akan lebih cepat, teliti, dan akurat. Penggunaan aplikasi keuangan ini dapat memantau alur transaksi keuangan, sehingga dapat mengetahui pendapatan ataupun pengeluaran keuangan yang sedang dijalankan.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "KONTAK KAMI :",
                        style: TextStyle(
                          fontSize: 18,
                          color: krem,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kontak("assets/ig.png", "money.manager"),
                            SizedBox(
                              height: 15,
                            ),
                            kontak("assets/wa.png", "0823-2123-3334"),
                            SizedBox(
                              height: 15,
                            ),
                            kontak(
                                "assets/email.png", "moneymanager@gmail.com"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kontak("assets/fb.png", "Money Manager"),
                            SizedBox(
                              height: 15,
                            ),
                            kontak("assets/twitter.png", "@money.manager"),
                            SizedBox(
                              height: 15,
                            ),
                            kontak("assets/yt.png", "MoneyManager"),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row kontak(param1, param2) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(param1), fit: BoxFit.fill),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          param2,
          style: TextStyle(color: krem, fontSize: 12),
        ),
      ],
    );
  }
}
