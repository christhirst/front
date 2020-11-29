import 'package:flutter/material.dart';
import '../screens/edit_demands_screen.dart';
import 'package:provider/provider.dart';
import 'package:front/providers/demands.dart';

class UserDemandsItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserDemandsItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(''),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditDemandScreen.routeName, arguments: id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<Demands>(context, listen: false).deleteDemand(id);
              },
              color: Theme.of(context).errorColor,
            )
          ],
        ),
      ),
    );
  }
}
