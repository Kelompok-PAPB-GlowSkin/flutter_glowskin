import 'package:flutter/material.dart';
import 'package:glowskin_project/constans.dart';
import 'package:glowskin_project/users/favoritepage.dart';
import 'package:glowskin_project/users/homepage.dart';
import 'package:glowskin_project/users/profilepage.dart';

class LandingPage2 extends StatefulWidget {
  @override
  State<LandingPage2> createState() => _LandingPage2State();
}

class _LandingPage2State extends State<LandingPage2> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [
    new HomePage(),
    new FavoritePage(),
    new ProfilPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Palette.bg2,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.home,
              color: Palette.bg2,
            ),
            icon: new Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Home Page',
          ),
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.favorite,
              color: Palette.bg2,
            ),
            icon: new Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.person,
              color: Palette.bg2,
            ),
            icon: new Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
