import 'dart:io';
import 'package:flutter/material.dart';
import 'package:glowskin_project/utils/user_preferences.dart';
import 'package:glowskin_project/model/user.dart';
import 'package:glowskin_project/widgets/profile_widget.dart';
import 'package:glowskin_project/widgets/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
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
            ProfileWidget(
              imagePath: user.imagePaths, 
              isEdits : true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label : 'Name',
              text : user.name,
              onChanged: (name) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label : 'Email',
              text : user.email,
              onChanged: (email) {},
            ),
          ],
        ),
      ),
    );
  }
}