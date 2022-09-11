import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("glowskin"),
      ),
      body: Center(
        child:
            Text(
              'You have pushed the button this many times:',
            )
      ),
    );
  }
}