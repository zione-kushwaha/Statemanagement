import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isfavorate;
  Product(
      {required this.description,
      required this.id,
      required this.imageUrl,
      required this.price,
      required this.title,
      this.isfavorate = false});
  void tooggle() {
    isfavorate = !isfavorate;
    notifyListeners();
  }
}
