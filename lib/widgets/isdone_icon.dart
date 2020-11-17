import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:front/providers/DemandForm.dart';

Widget changeIcon(BuildContext context) {
  final demand = Provider.of<DemandForm>(context);
  return Align(
      alignment: Alignment.topRight,
      child: Icon(
        demand.isDone ? Icons.done : Icons.assignment_late,
        color: Colors.green,
        size: 30,
      ));
}

Widget cartIcon(BuildContext context) {
  final demand = Provider.of<DemandForm>(context);
  return Align(
      alignment: Alignment.topRight,
      child: Icon(
        demand.isDone ? Icons.add_shopping_cart : Icons.remove_shopping_cart,
        color: Colors.green,
        size: 30,
      ));
}
