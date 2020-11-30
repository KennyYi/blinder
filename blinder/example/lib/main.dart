import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:blinder/blinder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isBlind = false;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Blinder example'),),
        body: Center(
          child: FlatButton(
            onPressed: () {
              if (isBlind) {
                Blinder.open().then((value) => setState(() => isBlind = false));
              } else {
                Blinder.blind().then((value) => setState(() => isBlind = true));
              }
            },
            child: Text("${isBlind?("Blind"):("Open")}"),
          ),
        ),
      ),
    );
  }
}
