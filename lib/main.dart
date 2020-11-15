import 'package:flutter/material.dart';
import './screens/demand_overview_screen.dart';
import './screens/form_overview_screen.dart';
import './screens/demand_details_screen.dart';

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
      theme:
          ThemeData(primarySwatch: Colors.grey, accentColor: Colors.deepOrange),
      home: DemandOverviewScreen(),
      routes: {
        DemandDetailScreen.routeName: (ctx) => DemandDetailScreen(),
      },
    );
  }
}
