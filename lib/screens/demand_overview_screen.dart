import 'package:flutter/material.dart';
import '../widgets/demands_list.dart';

class DemandOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Form Shop')), body: DemandsList());
  }
}
