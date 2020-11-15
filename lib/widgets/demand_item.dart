import 'package:flutter/material.dart';
import 'package:front/models/DemandForm.dart';
import 'package:front/screens/demand_overview_screen.dart';
import '../widgets/demand_item.dart';
import '../screens/demand_details_screen.dart';

class DemandItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  DemandItem(this.id, this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: new InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(DemandDetailScreen.routeName, arguments: id);
          },
          child: Padding(
            padding: EdgeInsets.all(7),
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[],
                            )
                          ],
                        ))
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
