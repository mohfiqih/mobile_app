import 'package:flutter/material.dart';
import 'package:mobile_app/dashboard/dashboard.dart';
import 'package:mobile_app/history_user/model_user.dart';
import 'package:mobile_app/history_user/service_user.dart';

class DataUserBaru extends StatefulWidget {
  @override
  State<DataUserBaru> createState() => _DataUserBaruState();
}

class _DataUserBaruState extends State<DataUserBaru> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  late List<User> user;
  var isLoaded = false;
  ScrollController _scrollController = ScrollController();
  int currentPage = 1;
  int pageSize = 10;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getRecord();
    _scrollController.addListener(_scrollListener);
  }

  Future<void> getRecord() async {
    user = await UserApi().getAllUser(page: currentPage, pageSize: pageSize);
    if (user != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (!isLoading) {
        setState(() {
          currentPage++;
          isLoading = true;
        });
        loadMoreData();
      }
    }
  }

  Future<void> loadMoreData() async {
    List<User> newUsers =
        await UserApi().getAllUser(page: currentPage, pageSize: pageSize);
    setState(() {
      user.addAll(newUsers);
      isLoading = false;
    });
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 200,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 200,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History User',
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
      body: FutureBuilder<List<User>>(
        future: UserApi().getAllUser(page: currentPage, pageSize: pageSize),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<User> user = snapshot.data ?? [];
            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text('Email'),
                      ),
                      DataColumn(
                        label: Text('Nama'),
                      ),
                      // DataColumn(
                      //   label: Text('Level'),
                      // ),
                      // DataColumn(
                      //   label: Text('Tanggal'),
                      // ),
                    ],
                    rows: List<DataRow>.generate(
                      user.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(
                            Text(user[index].email),
                          ),
                          DataCell(
                            Text(user[index].name),
                          ),
                          // DataCell(
                          //   Text(user[index].level),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _scrollLeft,
                      child: Icon(Icons.arrow_back_ios),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 250),
                    ElevatedButton(
                      onPressed: _scrollRight,
                      child: Icon(Icons.arrow_forward_ios),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                    ),
                  ],
                ),
                if (isLoading) CircularProgressIndicator(),
              ],
            );
          }
        },
      ),
    );
  }
}
