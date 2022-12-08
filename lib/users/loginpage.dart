import 'package:flutter/material.dart';
import 'package:glowskin_project/users/landingpage2.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'dart:io';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class SizeConfig {
  double heightSize(BuildContext context, double size) {
    return MediaQuery.of(context).size.height * size;
  }

  double widthSize(BuildContext context, double size) {
    return MediaQuery.of(context).size.width * size;
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = "";
  String password = "";

  _LoginPageState() {
    nameController.addListener(() {
      setState(() {
        email = nameController.text;
      });
    });
    passwordController.addListener(() {
      setState(() {
        password = passwordController.text;
      });
    });
  }

  // String url = Platform.isAndroid ? 'http://192.168.1.26:3001' : 'http://localhost:3001';
  String url = Platform.isAndroid ? "http://192.168.1.35:3001" : 'http://localhost:3001';

  Future login() async {
    try {
      var dio = Dio();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["accept"] = "application/json";
      var response = await dio.post(url + '/user/login',
          data: {"email": email, "password": password});
      print(response.data);
      prefs.setString('token', response.data['token']);
      prefs.setString('email', response.data['email']);
      // print(prefs.getString('token'));
      AlertDialog alert = AlertDialog(
        title: Text("Login"),
        content: Text(response.data['message']),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(new MaterialPageRoute(builder: (_) {
                return new LandingPage2();
              }));
            },
            child: Text("OK"),
          ),
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
      return response.data;
    } catch (e) {
      if (e is DioError) {
        // print(e.response!.data);
        // print(e.response!.statusCode);
        AlertDialog alert = AlertDialog(
          title: Text("Login"),
          content: Text(e.response!.data['error']['message']),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }
    }
  }

  Future<void> getAllPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('ini token');
    print(prefs.getString('token'));
    print('ini email');
    print(prefs.getString('email'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'GlowSkin',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 25),
                  )),
              Container(
                height: 300,
                padding: const EdgeInsets.fromLTRB(80, 10, 0, 0),
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/logo.png',
                  ),
                  fit: BoxFit.fitHeight,
                )),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                  height: 60,
                  width: 125,
                  padding: const EdgeInsets.fromLTRB(100, 10, 100, 0),
                  child: ElevatedButton(
                    child: const Text('Login',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF51AD99),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      login();
                      getAllPrefs();
                      // print(nameController.text);
                      // print(passwordController.text);
                    },
                  )),
            ],
          )),
    );
  }
}
