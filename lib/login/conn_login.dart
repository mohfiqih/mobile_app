// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:email_auth/email_auth.dart';
import 'package:email_otp/email_otp.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:mobile_app/ip/ip.dart';
import 'package:mobile_app/token/token.dart';

class Conn_Login {
  static final _client = http.Client();

  static var _loginUrl = Uri.parse(ip + 'login');

  static flutter_login(email, password, context) async {
    http.Response response = await _client.post(
      _loginUrl,
      body: {
        "email": email,
        "password": password,
      },
    );

    var json = jsonDecode(response.body);
    var token = json['token'];

    if (response.statusCode == 200) {
      // Jika sudah ada maka tidak dapat masuk
      if (json['message'] == 'Login berhasil!! cek email') {
        await EasyLoading.showSuccess(json['message']);

        try {
          var userEmail = 'mfiqiherinsyah90@gmail.com';
          final message = Message()
            ..from = Address(userEmail, 'Token Login')
            ..recipients.add(email)
            ..subject = 'Silahkan token untuk masuk aplikasi!'
            ..html = "<h3>Token login anda : </h3>\n<p>${token}</p>";

          final smtpServer = gmail(userEmail, 'tjtgpeymuxkbbewc');

          try {
            final sendReport = await send(message, smtpServer);
            print('Token berhasil dikirim: ' + sendReport.toString());
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => TokenPage()));
          } on MailerException catch (e) {
            print('Token gagal dikirim!');
            for (var p in e.problems) {
              print('Problem: ${p.code}: ${p.msg}');
            }
          }
        } catch (e) {
          print("Gagal kirim Token!");
          var gagal_token = "Gagal kirim Token!";
          EasyLoading.showError(gagal_token);
        }
      } else {
        print("Gagal login");
        var gagal_login = "Password anda salah!";
        EasyLoading.showError(gagal_login);
      }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
