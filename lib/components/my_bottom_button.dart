import 'package:coffee_shop/pages/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomButton extends StatelessWidget {
  final Map<String, int> cartItems;
  final int quantity;
  const MyBottomButton({
    super.key,
    this.quantity = 0,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CartScreen(cartItems: cartItems)));
        },
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Color(0xff6C331E),
            borderRadius: BorderRadius.circular(15.0),
          ),
          height: 80,
          child: Row(
            children: [
              SvgPicture.asset('assets/cup_white.svg'),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' You have $quantity items in queue ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Queue is empty start adding coffee.',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
