import 'package:flutter/material.dart';
import '../models/DemandForm.dart';
import '../widgets/demand_item.dart';

class DemandOverviewScreen extends StatelessWidget {
  final List<DemandForm> loadedProducts = [
    DemandForm(id: "1", title: "Eins", description: "test1"),
    DemandForm(id: "2", title: "Zwei", description: "test2"),
    DemandForm(id: "3", title: "Drei", description: "test3")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Form Shop')),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: loadedProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber,
              child: Center(
                  child: DemandItem(
                      loadedProducts[index].id,
                      loadedProducts[index].title,
                      loadedProducts[index].description)),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ));
  }
}
