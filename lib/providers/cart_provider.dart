import 'package:flutter/material.dart';

class CartItem {
  final String name;
  int quantity;

  CartItem({
    required this.name,
    this.quantity = 1
  })
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get itemCount => _cartItems.length;


  void addToCart (String flavor, int quantity) {
    for(var cartItem in _cartItems) {
    if (cartItem.containsKey(flavor)) {
      cartItem[flavor]! = (cartItem[flavor] ?? 0) + quantity;
    } else {
      cartItem[flavor] = quantity;
    }}
    notifyListeners();
  }
}
