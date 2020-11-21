import 'package:flutter/material.dart';
import 'DemandForm.dart';

class Demands with ChangeNotifier {
  List<DemandForm> _items = [
    DemandForm(
        id: "1",
        title: "Eins",
        description: "test1",
        isDone: true,
        price: 10,
        url: "https://google.de"),
    DemandForm(
        id: "2",
        title: "Zwei",
        description: "test2",
        isDone: false,
        price: 20,
        url: "https://google.de"),
    DemandForm(
        id: "3",
        title: "Drei",
        description: "test3",
        isDone: false,
        price: 30,
        url: "https://google.de")
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
