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

  void addDemand(DemandForm demand) {
    final newDemand = DemandForm(
        title: demand.title,
        description: demand.description,
        price: demand.price,
        id: DateTime.now().toString());
    _items.add(newDemand);
    notifyListeners();
  }

  void updateDemand(String id, DemandForm newDemand) {
    final demandIndex = _items.indexWhere((demand) => demand.id == id);
    if (demandIndex >= 0) {
      _items[demandIndex] = newDemand;
      notifyListeners();
    } else {
      print('..');
    }
  }

  void deleteDemand(String id) {
    _items.removeWhere((demand) => demand.id == id);
  }
}
