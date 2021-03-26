import 'package:flutter/material.dart';
import '../screens/user_demands_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        AppBar(
          title: Text("hi"),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text("Shop"),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text("Shop"),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/orders');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text("Mange Products"),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(UserDemandsScreen.routeName);
          },
        ),
      ],
    ));
  }
}
