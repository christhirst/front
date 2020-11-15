import 'package:flutter/material.dart';
import 'DemandForm.dart';

class Demands with ChangeNotifier {
  List<DemandForm> _items = [
    DemandForm(id: "1", title: "Eins", description: "test1", isDone: true),
    DemandForm(id: "2", title: "Zwei", description: "test2", isDone: false),
    DemandForm(id: "3", title: "Drei", description: "test3", isDone: false)
  ];

  List<DemandForm> get items {
    return [..._items];
  }

  DemandForm findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void addDemand() {
    //_item.add(value);
    notifyListeners();
  }
}
