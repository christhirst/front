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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 300,
              child: ListView(
                children: [Text("data"), Text("ff")],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$${loadedDemand.price}',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              loadedDemand.description,
              textAlign: TextAlign.center,
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
