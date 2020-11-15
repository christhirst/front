import 'package:flutter/material.dart';
import '../providers/DemandForm.dart';
import '../widgets/form_item.dart';

class FormOverviewScreen extends StatelessWidget {
  final List<DemandForm> loadedProducts = [
    DemandForm(id: "1", title: "Eins", description: "test1"),
    DemandForm(id: "2", title: "Zwei", description: "test2"),
    DemandForm(id: "3", title: "Drei", description: "test3")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Shop')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => FormItem(loadedProducts[i].id,
            loadedProducts[i].title, loadedProducts[i].description),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
      ),
    );
  }
}
