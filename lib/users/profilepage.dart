import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:glowskin_project/utils/user_preferences.dart';
import 'package:glowskin_project/widgets/profile_widget.dart';
import 'package:glowskin_project/users/editprofilepage.dart';
import 'package:dio/dio.dart';
import 'dart:io';


class ProfilPage extends StatefulWidget {
  @override
  State<ProfilPage> createState() => _ProfilPageState();
}


class _ProfilPageState extends State<ProfilPage> {
  @override

  // String url = Platform.isAndroid ? "http://192.168.1.24:3001" : 'http://localhost:3001';
  String url = 'https://6b84-2001-448a-6000-2dd-21ad-b7a5-51c6-d7c2.ap.ngrok.io';

  Future getUser() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token')!;
      String email = prefs.getString('email')!;
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["accept"] = "application/json";
      var response = await dio.get(url + '/user/get-user-by-email/$email');
      print(response.data);
      return response.data;
    }catch(e){
      print(e);
    }
  }

  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    getUser();
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
              child: FutureBuilder(
                future: getUser(),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return Column(
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
                          margin: EdgeInsets.only(right: 150),
                          padding: EdgeInsets.only(bottom: 30),
                          child: Text(
                            snapshot.data['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
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
                          margin: EdgeInsets.only(right: 50),
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            snapshot.data['email'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    );
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
