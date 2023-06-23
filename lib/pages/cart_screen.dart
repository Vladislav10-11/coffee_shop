import 'package:coffee_shop/components/queue_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, int>> cartItems;
  const CartScreen({super.key, required this.cartItems});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDE2D4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF6F0E9),
        foregroundColor: Color(0xff6C331E),
        title: Text('Coffee Queue'),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Column(
        children: [ListView.builder(itemBuilder: widget.cartItems.length)],
      ),
    );
  }
}
