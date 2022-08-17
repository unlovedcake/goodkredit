import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:goodkredit/Pages/Home-Page/bottom-navbar/notification.dart';
import 'package:goodkredit/Pages/Home-Page/bottom-navbar/vouchers.dart';
import 'package:goodkredit/Pages/Home-Page/favourites-used-listview.dart';
import 'package:goodkredit/Pages/Home-Page/recently-used-listview.dart';
import 'package:goodkredit/Router/navigate-route.dart';

import 'bottom-navbar/more.dart';
import 'bottom-navbar/qr.dart';
import 'home-listview.dart';
import '../../login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid = "";

  int _selectedIndex = 0;
  final List<Widget> _childrenSceen = [
    const QR(),
    const Vouchers(),
    const HomeListView(),
    const Notifications(),
    const More(),
  ];

  int currentTab = 0;
  final PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentScreen = const HomeContent();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageStorage(
        bucket: pageStorageBucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: () {

          setState(() {
            currentScreen = const HomeContent();
            currentTab = 2;
          });

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.dashboard,
                          color: currentTab == 0 ? Colors.blue : Colors.grey),
                      Text(
                        "QR",
                        style: TextStyle(
                          fontSize: 10,
                            color:
                                currentTab == 0 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = QR();
                      currentTab = 0;
                    });
                  }),
              MaterialButton(
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.dashboard,
                          color: currentTab == 1 ? Colors.blue : Colors.grey),
                      Text(
                        "Vouchers",
                        style: TextStyle(
                            fontSize: 10,
                            color:
                            currentTab == 1 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = Vouchers();
                      currentTab = 1;
                    });
                  }),
              MaterialButton(
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 25,),
                      Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 10,
                            color:
                            currentTab == 2 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = HomeContent();
                      currentTab = 2;
                    });
                  }),

              MaterialButton(
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.dashboard,
                          color: currentTab == 3 ? Colors.blue : Colors.grey),
                      Text(
                        "Notification",
                        style: TextStyle(
                            fontSize: 10,
                            color:
                            currentTab == 3 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = Notifications();
                      currentTab = 3;
                    });
                  }),
              MaterialButton(
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.dashboard,
                          color: currentTab == 4 ? Colors.blue : Colors.grey),
                      Text(
                        "More",
                        style: TextStyle(
                            fontSize: 10,
                            color:
                            currentTab == 4 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      currentScreen = const More();
                      currentTab = 4;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.ac_unit_outlined,
          color: Colors.lightBlueAccent,
        ),
        centerTitle: true,
        title: const Text(
          'Welcome GoodKredit',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {

              },
              child: const Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Search",
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height,
                  child: ListView(children: [
                    FavouritesUsedListView(),

                    HomeListView(),

                    RecentlyUsedListView(),

                  ],),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}


