import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobile_app/ip/ip.dart';
import 'package:mobile_app/login/login.dart';

class Conn_register {
  static final _client = http.Client();

  static var _registerUrl = Uri.parse(ip + 'register-user');

  static flutter_register(email, name, password, re_password, context) async {
    http.Response response = await _client.post(
      _registerUrl,
      body: {
        "email": email,
        "name": name,
        "password": password,
        "re_password": re_password,
      },
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      // Jika sudah ada maka tidak dapat masuk
      if (json[0] == 'Email Telah digunakan!') {
        EasyLoading.showError(json[0]);
      } else {
        await EasyLoading.showSuccess(json[0]);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
