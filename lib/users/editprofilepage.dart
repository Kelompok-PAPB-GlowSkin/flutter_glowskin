import 'dart:io';
import 'package:flutter/material.dart';
import 'package:glowskin_project/utils/user_preferences.dart';
import 'package:glowskin_project/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:glowskin_project/widgets/profile_widget.dart';
import 'package:glowskin_project/widgets/textfield_widget.dart';
import 'package:dio/dio.dart';

class EditProfilePage extends StatefulWidget {

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();

  String _nama = '';
  String _email = '';

  _EditProfilePageState() {
    nama.addListener(() {
      setState(() {
        _nama = nama.text;
      });
    });
    email.addListener(() {
      setState(() {
        _email = email.text;
      });
    });
  }

  // String url = Platform.isAndroid ? "http://192.168.1.68:3001" : 'http://localhost:3001';
  String url = 'https://6b84-2001-448a-6000-2dd-21ad-b7a5-51c6-d7c2.ap.ngrok.io';

  void printUser(){
    print(nama.text);
    print(email.text);
  }

  Future getUserInfo() async {
    try{
      SharedPreferences akun = await SharedPreferences.getInstance();
      String email = akun.getString('email')!;
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["accept"] = "application/json";
      var response = await dio.get(url + '/user/get-user-by-email/$email');
      print(response.data);
      return response.data;
    }catch(e){
      print(e);
      if(e is DioError){
        print(e.response!.data);
        print(e.response!.statusCode);
      }
    }
  }

  Future updateUser() async {
    try{
      SharedPreferences akun = await SharedPreferences.getInstance();
      String id = akun.getString('id')!;
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["accept"] = "application/json";
      var response = await dio.put(url + '/user/update-user/$id', data: {
        "name": _nama,
        "email": _email
      });
      print(response.data);
      // return response.data;
      Navigator.of(context).pop();
    }
    catch(e){
      print(e);
      // if(e is DioError){
      //   print(e.response!.data);
      //   print(e.response!.statusCode);
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    User user = UserPreferences.myUser;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: getUserInfo(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView(
              children: <Widget>[
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                TextField(
                  controller: nama,
                  decoration: InputDecoration(
                    hintText: snapshot.data['name'],
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: snapshot.data['email'],
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {updateUser();},
                  child: Text('Save'),
                ),
              ],
            );
            }
            return Text("data tidak ada");
          },
        )
      ),
    );
  }
}