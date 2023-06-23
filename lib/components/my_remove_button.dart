import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyRemoveButton extends StatelessWidget {
  final VoidCallback clearCart;
  const MyRemoveButton({
    super.key,
    required this.clearCart,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff6C331E),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0))),
      onPressed: () => clearCart(),
      child: Row(
        children: [
          SvgPicture.asset('assets/cup_white.svg'),
          Text(
            'Clear Your Cart',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
