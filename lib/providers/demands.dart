import 'package:flutter/material.dart';
import '../models/DemandForm.dart';

class Demands with ChangeNotifier {
  List<DemandForm> _items = [
    DemandForm(id: "1", title: "Eins", description: "test1"),
    DemandForm(id: "2", title: "Zwei", description: "test2"),
    DemandForm(id: "3", title: "Drei", description: "test3")
  ];

  List<DemandForm> get items {
    return [..._items];
  }

  void addDemand() {
    //_item.add(value);
    notifyListeners();
  }
}
