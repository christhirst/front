import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/demand_item.dart';
import '../providers/demands.dart';

class DemandsList extends StatelessWidget {
  final bool showDones;
  DemandsList(this.showDones);
  @override
  Widget build(BuildContext context) {
    final demandsData = Provider.of<Demands>(context);
    final demands = showDones ? demandsData.isDoneItems : demandsData.items;
    return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: demands.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
            value: demands[index],
            child: Container(
              height: 50,
              color: Colors.amber,
              child: Center(child: DemandItem()),
            )),
        separatorBuilder: (BuildContext ctx, int index) => const Divider());
  }
}
