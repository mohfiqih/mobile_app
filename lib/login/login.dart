import 'package:flutter/material.dart';
import 'package:mobile_app/login/conn_login.dart';
import 'package:mobile_app/register/register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Akun',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        centerTitle: true,
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Akses Login',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Masukan username dan password anda terlebih dahulu!',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),

                SizedBox(height: 50),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      print("email : " + email);
                      print("password : " + password);
                      await Conn_Login.flutter_login(email, password, context);
                    } else {
                      print("Validation Error");
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) {
                        return RegisterPage();
                      }),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // SizedBox(height: 20),
                // InkWell(
                //   onTap: () async {
                //     // if (_formState.currentState!.validate()) {
                //     //   print("email : " + email!);
                //     //   print("password : " + password!);
                //     //   await Controller_Login.flutter_login(
                //     //       email, password, context);
                //     // } else {
                //     //   print("Validation Error");
                //     // }
                //   },
                //   child: Container(
                //     margin: const EdgeInsets.symmetric(
                //       horizontal: 5,
                //     ),
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         SizedBox(width: 120),
                //         Text(
                //           "Reset Password",
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               color: Colors.white,
                //               fontSize: 20),
                //         ),
                //       ],
                //     ),
                //     height: 60,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //         color: Colors.blue,
                //         borderRadius: BorderRadius.circular(15)),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
