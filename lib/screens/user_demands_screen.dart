import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/demands.dart';
import '../widgets/user_demands_item.dart';
import '../widgets/app_drawer.dart';
import 'edit_demands_screen.dart';

class UserDemandsScreen extends StatelessWidget {
  static const routeName = '/user-demands';
  @override
  Widget build(BuildContext context) {
    final demandsData = Provider.of<Demands>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Demands'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditDemandScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: demandsData.items.length,
          itemBuilder: (_, i) => Column(
            children: [
              UserDemandsItem(
                  demandsData.items[i].title, demandsData.items[i].url),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
