import 'package:flutter/material.dart';
import 'package:glowskin_project/users/landingpage2.dart';
import 'package:glowskin_project/users/launcher2.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class SizeConfig{
  double heightSize(BuildContext context, double size){
    return MediaQuery.of(context).size.height * size;
  }
  double widthSize(BuildContext context, double size){
    return MediaQuery.of(context).size.width * size;
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _email = "";
  String _password = "";

  _LoginPageState() {
    nameController.addListener(() {
      setState(() {
        _email = nameController.text;
      });
    });
    passwordController.addListener(() {
      setState(() {
        _password = passwordController.text;
      });
    });
  }

  void _emailListen() {
    if (nameController.text.isEmpty) {
      _email = "";
    } else {
      _email = nameController.text;
    }
  }

  void _passwordListen() {
    if (passwordController.text.isEmpty) {
      _password = "";
    } else {
      _password = passwordController.text;
    }
  }

  Login(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      title: Text("Login"),
      actions: [
        if (_email == "admin" && _password == "admin")
          ElevatedButton(
            onPressed: () {Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
              return new LandingPage2();
            }));},
            child: Text("OK"),
          ),
        if (_email != "admin" || _password != "admin")
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
      ],
      content: (_email == "admin" && _password == "admin")
          ? Text("Login Berhasil, Selamat Datang di GlowSkin") 
          : Text("Login Gagal, Silahkan isi email dan password dengan benar"),
    ); 
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
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
                      Login(context);
                      print(nameController.text);
                      print(passwordController.text);
                    },
                  )),
            ],
          )),
    );
  }
}
