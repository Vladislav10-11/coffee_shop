import 'package:coffee_shop/models/product_model.dart';
import 'package:flutter/material.dart';

class CartItem {
  int id;
  final String name;
  int quantity;

  CartItem({
    required this.name,
    this.quantity = 1,
    required this.id,
  });
}

class CartProvider extends ChangeNotifier {
  List menucoffee = [
    Product(
      id: 0,
      name: 'Cappuccino',
      flavors: [
        {
          'name': 'Caramel Cappuccino',
          'description': 'Delicious caramel flavor'
        },
        {'name': 'Honey Cappuccino', 'description': 'Sweet honey flavor'},
        {'name': 'Vanilla Cappuccino', 'description': 'Smooth vanilla flavor'},
      ],
    ),
    Product(
      id: 1,
      name: 'Mocha',
      flavors: [
        {'name': 'Chocolate Mocha', 'description': 'Rich chocolate flavor'},
        {'name': 'Hazelnut Mocha', 'description': 'Delightful hazelnut flavor'},
        {'name': 'Cinnamon Mocha', 'description': 'Warm cinnamon flavor'},
      ],
    ),
    Product(
      id: 2,
      name: 'Latte',
      flavors: [
        {'name': 'Caramel Latte', 'description': 'Creamy caramel flavor'},
        {'name': 'Toffee Latte', 'description': 'Buttery toffee flavor'},
        {
          'name': 'Irish Cream Latte',
          'description': 'Irish cream-infused flavor'
        },
        {'name': 'Vanilla Latte', 'description': 'Make your day-y.'}
      ],
    ),
  ];
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get itemCount => _cartItems.length;

  void addToCart(CartItem item) {
    var coffeeItem = _cartItems.firstWhere((element) => element.id == item.id,
        orElse: () => null as CartItem);
    notifyListeners();
  }

  void removeFromCart(String itemId) {
    _cartItems.removeWhere(
      (element) => element.id == itemId,
    );
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
