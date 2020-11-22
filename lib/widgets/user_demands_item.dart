import 'package:flutter/material.dart';

class UserDemandsItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserDemandsItem(this.title, this.imageUrl);

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
              onPressed: () {},
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
              color: Theme.of(context).errorColor,
            )
          ],
        ),
      ),
    );
  }
}
