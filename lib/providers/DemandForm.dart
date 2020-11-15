import 'package:flutter/foundation.dart';

class DemandForm with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String url;
  int fields;
  bool isDone;

  DemandForm({
    @required this.id,
    @required this.title,
    @required this.description,
    this.price,
    this.url,
    this.isDone,
  });

  void toggleIsDoneStatus() {
    isDone = !isDone;
    notifyListeners();
  }
}
