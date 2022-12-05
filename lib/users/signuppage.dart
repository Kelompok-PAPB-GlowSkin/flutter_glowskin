import 'package:flutter/material.dart';
import 'package:glowskin_project/users/landingpage.dart';
import 'package:glowskin_project/users/launcher2.dart';
import 'package:dio/dio.dart';
import 'dart:io';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String username = '';
  String name = '';
  String email = '';
  String password = '';
  

  // String url =  Platform.isAndroid ? 'http://192.168.1.26:3001' : 'http://localhost:3001';
  String url = 'https://6b84-2001-448a-6000-2dd-21ad-b7a5-51c6-d7c2.ap.ngrok.io';

  _SignUpPageState() {
    usernameController.addListener(() {
      setState(() {
        username = usernameController.text;
      });
    });
    nameController.addListener(() {
      setState(() {
        name = nameController.text;
      });
    });
    emailController.addListener(() {
      setState(() {
        email = emailController.text;
      });
    });
    passwordController.addListener(() {
      setState(() {
        password = passwordController.text;
      });
    });
  }

  Future<void> signUp() async {
    try {
      var response = await Dio().post(
        url + '/user/add-user',
        data: {
          "username": username,
          "password": password,
          "name": name,
          "email": email,
        },
      );
      print(response.data);
      AlertDialog alert = AlertDialog(
        title: Text("Sign Up"),
        content: Text("Berhasil Mendaftar"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_){
                return LandingPage();
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
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data);
        print(e.response!.statusCode);
        AlertDialog alert = AlertDialog(
          title: Text("Sign Up"),
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
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/logo.png',
                  ),
                  fit: BoxFit.fitHeight,
                )),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: 'Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
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
                    child: const Text('Sign Up',
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
                      signUp();
                      print(nameController.text);
                      print(emailController.text);
                      print(usernameController.text);
                      print(passwordController.text);                     
                    },
                  )),
            ],
          )),
    );
  }
}
