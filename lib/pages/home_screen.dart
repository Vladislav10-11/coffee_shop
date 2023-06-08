import 'package:coffee_shop/components/card_coffee.dart';
import 'package:coffee_shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List menucoffee = [
    Product(name: 'Affogato', flavor: 3),
    Product(name: 'Americano', flavor: 1),
    Product(name: 'Cappuccino', flavor: 5),
    Product(name: 'Latte', flavor: 5),
    Product(name: 'Mocha', flavor: 4),
    Product(name: 'Machiato', flavor: 3),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffE0CAB8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF6F0E9),
        foregroundColor: Color(0xff6C331E),
        title: Text('Enjoy life sip by sip.'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset('assets/cup.svg'),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Max',
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6C331E)),
                ),
                Text(
                  'Let\'s get you a coffee!',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Color(0xff6C331E),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  width: size.width,
                  height: 90,
                  decoration: BoxDecoration(
                      color: Color(0xffDAC1A5),
                      border: Border.all(color: Color(0xff6C331E), width: 1.0),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset('assets/icon.svg'),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Get 25% off on your first order.',
                            style: GoogleFonts.inter(
                                fontSize: 14, color: Color(0xff6C331E)),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Menu',
                  style: GoogleFonts.inter(
                      color: Color(0xff6C331E),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Divider(color: Colors.white),
                SizedBox(
                  height: 450,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: menucoffee.length,
                      itemBuilder: (context, index) {
                        return CardCoffee(
                          flavor: menucoffee[index].flavor,
                          name: menucoffee[index].name,
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
