import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

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

  void _setDoneValue(bool newVal) {
    isDone = newVal;
    notifyListeners();
  }

  void toggleIsDoneStatus(String token, String userId) async {
    final oldStatus = isDone;

    isDone = !isDone;
    notifyListeners();
    final url = 'http://$userId/$token';
    try {
      final response = await http.put(url,
          body: json.encode(
            isDone,
          ));
      if (response.statusCode >= 400) {
        _setDoneValue(oldStatus);
      }
    } catch (error) {
      _setDoneValue(oldStatus);
    }
  }
}
