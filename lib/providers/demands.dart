import 'package:flutter/material.dart';
import 'DemandForm.dart';

class Demands with ChangeNotifier {
  List<DemandForm> _items = [
    DemandForm(id: "1", title: "Eins", description: "test1", isDone: true),
    DemandForm(id: "2", title: "Zwei", description: "test2", isDone: false),
    DemandForm(id: "3", title: "Drei", description: "test3", isDone: false)
  ];

  var _showIsDoneOnly = false;

  List<DemandForm> get items {
    /*    if (_showIsDoneOnly) {
      return _items.where((prodItem) => prodItem.isDone).toList();
    } */
    return [..._items];
  }

  List<DemandForm> get isDoneItems {
    return _items.where((demandsItem) => demandsItem.isDone).toList();
  }

  DemandForm findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

/*   void showIsDoneOnly() {
    _showIsDoneOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showIsDoneOnly = false;
    notifyListeners();
  } */

  void addDemand() {
    //_item.add(value);
    notifyListeners();
  }
}
