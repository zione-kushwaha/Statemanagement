import 'package:flutter/material.dart';

class cartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  cartItem({
    required this.id,
    required this.title,
    required this.price,
    this.quantity = 1,
  });
}

class cart with ChangeNotifier {
  Map<String, cartItem> _list = {};

  Map<String, cartItem> get list {
    return {..._list};
  }

  void add_item(String productId, String tittle, double price) {
    if (_list.containsKey(productId)) {
      _list.update(
          productId,
          (value) => cartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              quantity: value.quantity + 1));
    } else {
      _list.putIfAbsent(productId,
          () => cartItem(id: productId, title: tittle, price: price));
    }
    notifyListeners();
  }

  int get get_count {
    return _list.length;
  }

  double get total_amount {
    double sum = 0;
    _list.forEach((key, value) {
      sum += value.price * value.quantity.toDouble();
    });
    return sum;
  }

  void remove_list(String id) {
    _list.remove(id);
    notifyListeners();
  }
}
