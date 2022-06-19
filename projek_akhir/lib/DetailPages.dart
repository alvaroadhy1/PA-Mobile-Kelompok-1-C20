import 'package:flutter/material.dart';
import 'package:projek_akhir/warna.dart';

class DetailPages extends StatelessWidget {
  String tanggal;
  String nama;
  String jumlah;
  String catatan;
  DetailPages({
    Key? key,
    required this.tanggal,
    required this.nama,
    required this.jumlah,
    required this.catatan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lebarLayar = MediaQuery.of(context).size.width;
    var tinggiLayar = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: biru,
        title: Padding(
          padding: const EdgeInsets.only(right: 45),
          child: Center(
              child: Text(
            "Detail Transaksi",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
      body: Container(
        width: lebarLayar,
        height: tinggiLayar,
        decoration: BoxDecoration(
          color: krem,
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
              width: lebarLayar * 8 / 10,
              height: tinggiLayar * 4 / 10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${nama}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Jumlah : Rp. ${jumlah}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Tanggal : ${tanggal}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Catatan : ",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          width: 165,
                          height: 134,
                          child: Text(
                            "${catatan}",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
