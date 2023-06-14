import 'package:flutter/material.dart';
import 'package:mobile_app/dashboard/dashboard.dart';
import 'package:mobile_app/login/login.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => DashboardPage(),
              ),
            ); // Kembali ke menu sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
              onTap: () {
                // Navigasi ke halaman pengaturan akun
                // Implementasikan logika navigasi sesuai kebutuhan Anda
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                // Navigasi ke halaman pengaturan notifikasi
                // Implementasikan logika navigasi sesuai kebutuhan Anda
              },
            ),
            Divider(),
            SizedBox(height: 16),
            Text(
              'App Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              onTap: () {
                // Navigasi ke halaman pengaturan bahasa
                // Implementasikan logika navigasi sesuai kebutuhan Anda
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
                // Tambahkan logika logout di sini
                // Implementasikan logika logout sesuai kebutuhan Anda
              },
            ),
          ],
        ),
      ),
    );
  }
}
