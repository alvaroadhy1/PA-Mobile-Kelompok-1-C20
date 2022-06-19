import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projek_akhir/Ctrl.dart';
import 'package:projek_akhir/warna.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextController textCtrl = Get.put(TextController());
  static final snackbar = SnackBar(
    content: Text(
      "Data Telah Ditambahkan!",
    ),
    duration: Duration(seconds: 3),
    backgroundColor: biru,
  );

  static final snackbarPilihDulu = SnackBar(
    content: Text(
      "Silakan Pilih Jenis Transaksi Terlebih Dahulu!",
    ),
    duration: Duration(seconds: 3),
    backgroundColor: pink,
  );

  var pilihForm = "";

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pendapatan = firestore.collection("pendapatan");
    CollectionReference pengeluaran = firestore.collection("pengeluaran");
    Container form(BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 7 / 10,
        width: MediaQuery.of(context).size.width,
        color: krem,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: TextField(
                cursorColor: coklat,
                keyboardType: TextInputType.datetime,
                controller: textCtrl.tanggalCtrl,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: coklat, width: 2.0),
                  ),
                  labelText: "Tanggal",
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: "Masukan Tanggal",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: TextField(
                cursorColor: coklat,
                keyboardType: TextInputType.text,
                controller: textCtrl.namaCtrl,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: coklat, width: 2.0),
                  ),
                  labelText: "Nama Transaksi",
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: "Masukan Nama Transaksi",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: TextField(
                cursorColor: coklat,
                keyboardType: TextInputType.phone,
                controller: textCtrl.jumlahCtrl,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: coklat, width: 2.0),
                  ),
                  labelText: "Jumlah Transaksi",
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: "Masukan Jumlah Transaksi",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
              child: TextFormField(
                maxLines: 4,
                cursorColor: coklat,
                keyboardType: TextInputType.text,
                controller: textCtrl.catatanCtrl,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: coklat),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: coklat, width: 2.0),
                  ),
                  labelText: "Catatan",
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: "Masukan Catatan Yang Perlu Anda Tambahkan",
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: pink,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: Text(
                      "Simpan",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              onTap: () {
                if (pilihForm == "Pendapatan") {
                  textCtrl.tambah(pendapatan);
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                } else if (pilihForm == "Pengeluaran") {
                  textCtrl.tambah(pengeluaran);
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(snackbarPilihDulu);
                }
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 45),
          child: Center(child: Text("Form Input")),
        ),
        backgroundColor: biru,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: krem,
        child: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    pilihForm = "Pendapatan";
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width / 2 - 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: biru,
                    ),
                    child: Center(
                      child: Text(
                        "Pendapatan",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    pilihForm = "Pengeluaran";
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width / 2 - 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: pink,
                    ),
                    child: Center(
                      child: Text(
                        "Pengeluaran",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: coklat,
                  ),
                ),
              ],
            ),
            form(context),
          ],
        ),
      ),
    );
  }
}
