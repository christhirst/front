import 'package:flutter/material.dart';

import './screens/form_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyForms',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: FormOverviewScreen(),
    );
  }
}
