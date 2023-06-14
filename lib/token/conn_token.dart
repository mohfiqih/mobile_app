import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/cupertino.dart';

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobile_app/dashboard/dashboard.dart';
import 'package:mobile_app/ip/ip.dart';

class Conn_token {
  static final _client = http.Client();

  static var _cekTokenUrl = Uri.parse(ip + 'basicToken');

  static flutter_token(token, context) async {
    http.Response response = await _client.post(
      _cekTokenUrl,
      body: {
        "token": token,
      },
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var pesan = json[0];
      print(pesan);
      if (json[0] == 'Anda sebagai admin!') {
        await EasyLoading.showSuccess(json[0]);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashboardPage()));
      } else if (json[0] == 'Berhasil masuk!') {
        await EasyLoading.showSuccess(json[0]);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashboardPage()));
      }
    } else {
      await EasyLoading.showError("Token anda salah");
    }
  }
}
