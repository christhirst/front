import 'dart:convert';

import 'package:flutter/material.dart';
import './cart.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> demands;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.demands,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProduct, double total) async {
    const url = '';
    final timestamp = DateTime.now();
    http.post(url,
        body: json.encode({
          'amount': total,
          'dataTime': timestamp.toIso8601String(),
          'demands': cartProduct.map((cp) => {
                'id': cp.id,
                'title': cp.title,
                'quantity': cp.quantity,
                'price': cp.price,
              })
        }));

    _orders.insert(
        0,
        OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          dateTime: DateTime.now(),
          demands: cartProduct,
        ));
    notifyListeners();
  }
}
