import 'package:flutter/material.dart';
import 'package:front/providers/demands.dart';
//import 'package:provider/provider.dart';
import '../widgets/demands_list.dart';

enum FilterOptions {
  Favorites,
  All,
}

class DemandOverviewScreen extends StatefulWidget {
  @override
  _DemandOverviewScreenState createState() => _DemandOverviewScreenState();
}

class _DemandOverviewScreenState extends State<DemandOverviewScreen> {
  bool _showOnlyIsDone = false;
  @override
  Widget build(BuildContext context) {
    //for system wide filter
    //final demandContainer = Provider.of<Demands>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Form Shop'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyIsDone = true;
                  } else {
                    _showOnlyIsDone = false;
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: Text('Only Favorites'),
                    value: FilterOptions.Favorites),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                )
              ],
            )
          ],
        ),
        body: DemandsList(_showOnlyIsDone));
  }
}
