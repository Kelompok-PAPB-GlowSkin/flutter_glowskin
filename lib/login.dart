import 'package:flutter/material.dart';
 
// void main() => runApp(const MyApp());
 
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
 
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: LoginPage(),
//       ),
//     );
//   }

//   MyStatefulWidget LoginPage() => const MyStatefulWidget();
// }
 
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
 
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
 
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                image : DecorationImage(
                  image: AssetImage(
                    'assets/img/logo.png',),
                  fit: BoxFit.fitHeight,
                  )
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  labelText: 'User Name',
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
                        fontWeight: FontWeight.w600
                        )),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF51AD99),
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                )
            ),
          ],
        ));
  }
}