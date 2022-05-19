import 'package:flutter/material.dart';

class OrdersProvider extends ChangeNotifier {
  List _orders = [];

  get orders => _orders;

  void setOrders(
    String item,
    int price,
    String uid,
    String status,
  ) {
    _orders.add({
      "item": item,
      "item_price": price,
      "user_id": uid,
      "status": status,
    });

    notifyListeners();
  }
}
