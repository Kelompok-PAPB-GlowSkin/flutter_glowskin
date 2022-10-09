import 'package:flutter/material.dart';

import 'package:glowskin_project/utils/user_preferences.dart';
import 'package:glowskin_project/widgets/profile_widget.dart';
import 'package:glowskin_project/users/editprofilepage.dart';


class ProfilPage extends StatefulWidget {
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}


class _ProfilPageState extends State<ProfilPage> {
  @override

  Widget build(BuildContext context) {

    final user = UserPreferences.myUser;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black, 
                      size: 30
                      ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: BorderSide(
                        color: const Color(0xFFEDEEF3),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 215,
                  child: Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: ProfileWidget(
                  imagePath : user.imagePaths,
                  onClicked : () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditProfilePage(),
                    ));
                  },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 130),
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Name",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 60),
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(
                      user.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 130),
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      user.email,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
