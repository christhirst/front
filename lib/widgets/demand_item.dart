import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:front/providers/DemandForm.dart';
import 'package:front/providers/cart.dart';
import 'package:front/screens/demand_overview_screen.dart';
import '../widgets/demand_item.dart';
import '../screens/demand_details_screen.dart';
import '../widgets/isdone_icon.dart';

class DemandItem extends StatelessWidget {
  /*  final String id;
  final String title;
  final String description; */
  //DemandItem(this.id, this.title, this.description);

  @override
  Widget build(BuildContext context) {
    final demand = Provider.of<DemandForm>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return Card(
        elevation: 5,
        child: new InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(DemandDetailScreen.routeName, arguments: demand.id);
          },
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(left: 10, top: 0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                IconButton(
                                  icon: cartIcon(context),
                                  onPressed: () {
                                    cart.addItem(
                                      demand.id,
                                      demand.price,
                                      demand.title,
                                    );
                                  },
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(demand.title),
                                IconButton(
                                  icon: changeIcon(context),
                                  onPressed: () {
                                    demand.toggleIsDoneStatus();
                                  },
                                ),
                                SizedBox(
                                  width: 10,
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
