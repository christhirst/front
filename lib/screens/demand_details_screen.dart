import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/demands.dart';

class DemandDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final demandId = ModalRoute.of(context).settings.arguments as String;
    final loadedDemand =
        Provider.of<Demands>(context, listen: false).findById(demandId);
    return Scaffold(
      appBar: AppBar(title: Text(loadedDemand.title)),
    );
  }
}
