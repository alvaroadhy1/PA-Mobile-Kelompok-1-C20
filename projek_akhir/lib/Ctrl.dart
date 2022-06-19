import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  var tanggal = ''.obs;
  var namaTransaksi = ''.obs;
  var jumlahTransaksi = ''.obs;
  var catatan = ''.obs;
  var email = ''.obs;
  var pass = ''.obs;

  final tanggalCtrl = TextEditingController();
  final namaCtrl = TextEditingController();
  final jumlahCtrl = TextEditingController();
  final catatanCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  loginregis() {
    email = emailCtrl.text.obs;
    pass = passCtrl.text.obs;
  }

  tambah(param) {
    param.add({
      'tanggal': tanggalCtrl.text,
      'nama': namaCtrl.text,
      'jumlah': jumlahCtrl.text,
      'catatan': catatanCtrl.text,
    });
  }

  updateData(param) {
    param.update({
      'tanggal': tanggalCtrl.text,
      'nama': namaCtrl.text,
      'jumlah': jumlahCtrl.text,
      'catatan': catatanCtrl.text,
    });
  }
}
