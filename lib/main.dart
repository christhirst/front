import 'package:flutter/material.dart';
import 'package:front/providers/cart.dart';
import 'package:provider/provider.dart';
import './screens/demand_overview_screen.dart';
import './screens/demand_details_screen.dart';
import './providers/demands.dart';
import './providers/orders.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_demands_screen.dart';
import './screens/edit_demands_screen.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Demands(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        )
      ],
      child: MaterialApp(
        title: 'MyForms',
        theme: ThemeData(
            primarySwatch: Colors.grey, accentColor: Colors.deepOrange),
        home: DemandOverviewScreen(),
        routes: {
          DemandDetailScreen.routeName: (ctx) => DemandDetailScreen(),
          CartScreen.routName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserDemandsScreen.routeName: (ctx) => UserDemandsScreen(),
          EditDemandScreen.routeName: (ctx) => EditDemandScreen(),
        },
      ),
    );
  }
}
