import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:glowskin_project/users/launcher2.dart';
import 'package:glowskin_project/users/loginpage.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        children: [
          SizedBox(height: 40),
          Text(
            'GlowSkin',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 13),
          Text(
            'Skincare',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Text(
            'for life',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 13),
          Container(
            alignment: Alignment.center,
            width: 301,
            height: 316,
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 39),
          Text(
            'Worldwide Information',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            'About Skincare',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48),
          Container(
            alignment: Alignment.center,
            width: 125,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return LauncherPage2();
                }));
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff51AD99),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
          SizedBox(height: 13),
          Container(
            alignment: Alignment.center,
            width: 125,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff51AD99),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
