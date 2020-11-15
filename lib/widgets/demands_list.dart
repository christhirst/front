import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/DemandForm.dart';
import '../widgets/demand_item.dart';
import '../providers/demands.dart';

class DemandsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final demandsData = Provider.of<Demands>(context);
    final demands = demandsData.items;
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: demands.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber,
          child: Center(
              child: DemandItem(demands[index].id, demands[index].title,
                  demands[index].description)),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
