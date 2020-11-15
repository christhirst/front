import 'package:flutter/material.dart';
import 'package:front/models/DemandForm.dart';

class FormItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  FormItem(this.id, this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: TextFormField(
        decoration: InputDecoration(labelText: description),
      ),
    );
  }
}
