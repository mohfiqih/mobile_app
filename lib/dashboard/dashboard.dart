import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/dashboard/live.dart';
import 'package:mobile_app/dashboard/live.dart';
import 'package:mobile_app/dashboard/settings.dart';
import 'package:mobile_app/history_user/view_user.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    CameraScreen(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_enhance),
            label: 'Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        children: [
          DashboardMenuItem(
            icon: Icons.add_chart_outlined,
            title: 'Grafik',
            onTap: () {
              // Navigator.of(context).pushReplacement(
              //     MaterialPageRoute(builder: (context) => CameraScreen()));
              print('Camera tapped');
            },
          ),
          DashboardMenuItem(
            icon: Icons.table_chart,
            title: 'History',
            onTap: () {
              // Handle calendar menu item tap
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => DataUserBaru()));
              print('Calendar tapped');
            },
          ),
        ],
      ),
    );
  }
}

class DashboardMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DashboardMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
