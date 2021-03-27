import 'package:flutter/material.dart';
import 'package:front/models/http_exception.dart';
import 'DemandForm.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Demands with ChangeNotifier {
  List<DemandForm> _items = [
    DemandForm(
        id: "1",
        title: "Eins",
        description: "test1",
        isDone: true,
        price: 10,
        url: "https://homepages.cae.wisc.edu/~ece533/images/airplane.png"),
    DemandForm(
        id: "2",
        title: "Zwei",
        description: "test2",
        isDone: false,
        price: 20,
        url: "https://homepages.cae.wisc.edu/~ece533/images/airplane.png"),
    DemandForm(
        id: "3",
        title: "Drei",
        description: "test3",
        isDone: false,
        price: 30,
        url: "https://homepages.cae.wisc.edu/~ece533/images/airplane.png")
  ];
  String authToken;

  //var _showIsDoneOnly = false;

  Demands(this.authToken, this._items);

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

  Future<void> fetchAndSetDemands() async {
    final url = 'http://localhost:9090/users?auth=$authToken';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<DemandForm> loadedDemands = [];
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((demId, demData) {
        loadedDemands.add(DemandForm(
          id: demId,
          title: demData['title'],
          description: demData['description'],
        ));
      });
      _items = loadedDemands;
      notifyListeners();
      print(json.decode(response.body));
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addDemand(DemandForm demand) async {
    final url = 'http://localhost:9090/users?auth=$authToken';
    try {
      final response = await http.post(url,
          body: json.encode({
            'title': demand.title,
            'description': demand.description,
            'url': demand.url,
            'price': demand.price,
            'isDone': demand.isDone,
          }));

      final newDemand = DemandForm(
          title: demand.title,
          description: demand.description,
          url: demand.url,
          price: demand.price,
          id: json.decode(response.body)['name']);
      _items.add(newDemand);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateDemand(String id, DemandForm newDemand) async {
    final demandIndex = _items.indexWhere((demand) => demand.id == id);
    if (demandIndex >= 0) {
      final url = 'http://localhost:9090/user/$id?auth=$authToken';
      await http.patch(url,
          body: json.encode({
            'title': newDemand.title,
            'description': newDemand.description,
          }));
      _items[demandIndex] = newDemand;
      notifyListeners();
    } else {
      print('..');
    }
  }

  Future<void> deleteDemand(String id) async {
    final url = 'http://localhost:9090/user/$id?auth=$authToken';
    final existingDemandIndex = _items.indexWhere((dema) => dema.id == id);
    var existingDemand = _items[existingDemandIndex];
    _items.removeAt(existingDemandIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingDemandIndex, existingDemand);
      notifyListeners();
      throw HttpException('Could not delete demand.');
    }
    existingDemand = null;
  }
}
