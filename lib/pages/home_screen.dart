import 'package:coffee_shop/components/card_coffee.dart';
import 'package:coffee_shop/components/my_bottom_button.dart';
import 'package:coffee_shop/models/product_model.dart';
import 'package:coffee_shop/pages/flavor_screen.dart';
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
        child: Stack(children: [
          Column(
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
                        border:
                            Border.all(color: Color(0xff6C331E), width: 1.0),
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
                          List<Map<String, String>> flavors =
                              menucoffee[index].flavors;
                          int flavor = flavors.length;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FlavorScreen(
                                            name: menucoffee[index].name,
                                            flavors: flavors,
                                          )));
                            },
                            child: CardCoffee(
                              icon: Icon(Icons.arrow_forward_ios),
                              flavor: flavor,
                              name: menucoffee[index].name,
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
          //MyBottomButton(),
        ]),
      ),
    );
  }
}
