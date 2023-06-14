import 'package:flutter/material.dart';
import 'package:mobile_app/login/conn_login.dart';
import 'package:mobile_app/login/login.dart';
import 'package:mobile_app/register/register.dart';
import 'package:mobile_app/token/conn_token.dart';

class TokenPage extends StatefulWidget {
  @override
  _TokenPageState createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  final _formKey = GlobalKey<FormState>();
  String token = '';
  // String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Token'),
        toolbarHeight: 65,
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'Akses Token',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Masukan untuk validasi akun anda!',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Token',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your token';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      token = value;
                    });
                  },
                ),
                // SizedBox(height: 16.0),
                // TextFormField(
                //   obscureText: true,
                //   decoration: InputDecoration(
                //     labelText: 'Password',
                //   ),
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter your password';
                //     }
                //     return null;
                //   },
                //   onChanged: (value) {
                //     setState(() {
                //       password = value;
                //     });
                //   },
                // ),
                SizedBox(height: 50),
                // ElevatedButton(
                //   onPressed: () {
                //     if (_formKey.currentState!.validate()) {}
                //   },
                //   child: Text('Login'),
                // ),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      print("token : " + token);
                      await Conn_token.flutter_token(token, context);
                    } else {
                      print("Validation Error");
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 160),
                        Text(
                          "Masuk",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
