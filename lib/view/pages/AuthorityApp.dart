import 'package:flutter/material.dart';
import 'package:nature_eye_witness_app/view/pages/main/profile_page.dart';

import 'main/alert_page.dart';

class AuthorityApp extends StatefulWidget {
  @override
  _AuthorityAppState createState() => _AuthorityAppState();
}

class _AuthorityAppState extends State<AuthorityApp> {
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
          AlertPage(),
          ProfilePage(),
        ],
      )),
    );
  }
}