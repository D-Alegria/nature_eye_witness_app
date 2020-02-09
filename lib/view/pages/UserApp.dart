import 'package:flutter/material.dart';
import 'package:nature_eye_witness_app/view/pages/main/home_page.dart';
import 'package:nature_eye_witness_app/view/pages/main/profile_page.dart';

import 'main/eye_witness_page.dart';
import 'main/feed_page.dart';

class UserApp extends StatefulWidget {
  @override
  _UserAppState createState() => _UserAppState();
}

class _UserAppState extends State<UserApp> {
  int _currentIndex = 0;
  PageController controller = PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.home,
                color: Colors.black26,
              ),
              title: Text("")),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.camera,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.home,
                color: Colors.black26,
              ),
              title: Text("")),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            icon: Icon(
              Icons.account_circle,
              color: Colors.black26,
            ),
            title: Text(
              "Account",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            controller.animateToPage(index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          });
        },
      ),
      body: SafeArea(
          child: PageView(
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: controller,
        children: <Widget>[
          HomePage(),
          EyeWitnessPage(),
          ProfilePage(),
        ],
      )),
    );
  }
}
