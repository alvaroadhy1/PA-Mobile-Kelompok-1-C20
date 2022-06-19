import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projek_akhir/Ctrl.dart';
import 'package:projek_akhir/DetailPages.dart';
import 'package:projek_akhir/warna.dart';

class Pendapatan extends StatefulWidget {
  const Pendapatan({Key? key}) : super(key: key);

  @override
  State<Pendapatan> createState() => _PendapatanState();
}

class _PendapatanState extends State<Pendapatan> {
  final TextController textCtrl = Get.put(TextController());

  static final snackbarHapus = SnackBar(
    content: Text(
      "Orderan Berhasil Dihapus!",
      style: TextStyle(fontSize: 18, color: Colors.white),
    ),
    duration: Duration(seconds: 3),
    backgroundColor: pink,
  );

  static final snackbarUbah = SnackBar(
    content: Text(
      "Orderan Berhasil Diubah!",
      style: TextStyle(fontSize: 18, color: Colors.white),
    ),
    duration: Duration(seconds: 3),
    backgroundColor: biru,
  );

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pendapatan = firestore.collection("pendapatan");

    Future<dynamic> CustomAlert(BuildContext context, String pesan, id) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(pesan),
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
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
                  padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
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
                  padding: const EdgeInsets.fromLTRB(25, 5, 25, 0),
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
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                  child: TextFormField(
                    maxLines: 3,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel")),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            textCtrl.updateData(id);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbarUbah);
                          },
                          child: Text("Submit")),
                    ],
                  ),
                ),
              ],
            );
          });
    }

    Widget CardTransaksi(tanggal, nama, jumlah, catatan, id) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailPages(
                  tanggal: tanggal,
                  nama: nama,
                  jumlah: jumlah,
                  catatan: catatan),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height / 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(206, 255, 255, 255),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 10 * 5,
                      child: Text(
                        "${nama}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Rp. ${jumlah}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        id.delete();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackbarHapus);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: pink,
                        ),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        CustomAlert(context, "Form Update", id);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: biru,
                        ),
                        child: Icon(
                          Icons.border_color_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
            " Daftar Pendapatan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
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
            StreamBuilder<QuerySnapshot>(
              stream: pendapatan.snapshots(),
              builder: (_, snapshot) {
                return (snapshot.hasData)
                    ? Column(
                        children: snapshot.data!.docs
                            .map(
                              (e) => CardTransaksi(
                                  e.get("tanggal"),
                                  e.get("nama"),
                                  e.get("jumlah"),
                                  e.get("catatan"),
                                  pendapatan.doc(e.id)),
                            )
                            .toList(),
                      )
                    : Text('Loading...');
              },
            ),
          ],
        ),
      ),
    );
  }
}
