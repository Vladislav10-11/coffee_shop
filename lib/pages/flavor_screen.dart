import 'package:coffee_shop/components/card_flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/my_bottom_button.dart';

class FlavorScreen extends StatefulWidget {
  final String name;
  final List<Map<String, String>> flavors;

  FlavorScreen({
    super.key,
    required this.flavors,
    required this.name,
  });

  @override
  State<FlavorScreen> createState() => _FlavorScreenState();
}

class _FlavorScreenState extends State<FlavorScreen> {
  Map<String, int> selectedQuantities = {};
  final _quantitySmallController = TextEditingController();
  final _quantityMediumController = TextEditingController();
  final _quantityLargeController = TextEditingController();
  int totalQuantity = 0;

  void _handleQuantitySelected(String flavorName, int quantity) {
    setState(() {
      selectedQuantities[flavorName] = quantity;
      totalQuantity =
          selectedQuantities.values.reduce((sum, value) => sum + value);
    });
    print(totalQuantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDE2D4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF6F0E9),
        foregroundColor: Color(0xff6C331E),
        title: Text('${widget.name} flavor'),
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
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SvgPicture.asset('assets/cup.svg')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What would you love to brew?',
                style: GoogleFonts.inter(
                    color: Color(0xff6C331E),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                'We have latte available in ${widget.flavors.length} flavors.',
                style: GoogleFonts.inter(color: Color(0xff6C331E)),
              ),
              SizedBox(
                height: 450,
                child: ListView.builder(
                    itemCount: widget.flavors.length,
                    itemBuilder: (context, index) {
                      String name = widget.flavors[index]['name']!;
                      String description =
                          widget.flavors[index]['description']!;
                      int quantity = selectedQuantities[name] ?? 0;
                      return GestureDetector(
                        onTap: () {
                          _showBottomSheet(context, name);
                        },
                        child: CardFlavor(
                            name: name,
                            description: description,
                            quantity: quantity,
                            icon: quantity > 0
                                ? Icon(Icons.check_circle)
                                : Icon(Icons.add)),
                      );
                    }),
              )
            ],
          ),
          MyBottomButton(
              quantity: totalQuantity, cartItems: selectedQuantities),
        ]),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String flavorName) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.0))),
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                color: Color(0xffEDE2D4),
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(24.0))),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select cup size',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff6C331E),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                _buildQuantityOption(
                  context,
                  'Large',
                  _quantitySmallController,
                ),
                _buildQuantityOption(
                  context,
                  'Small',
                  _quantityMediumController,
                ),
                _buildQuantityOption(
                  context,
                  'Medium',
                  _quantityLargeController,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        backgroundColor: Color(0xff6C331E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        int smallCupQuantity = int.tryParse(
                                _quantitySmallController.text.trim()) ??
                            0;
                        int mediumCupQuantity = int.tryParse(
                                _quantityMediumController.text.trim()) ??
                            0;
                        int largeCupQuantity = int.tryParse(
                                _quantityLargeController.text.trim()) ??
                            0;
                        int selectedQuantity = smallCupQuantity +
                            mediumCupQuantity +
                            largeCupQuantity;

                        _handleQuantitySelected(flavorName, selectedQuantity);

                        _quantitySmallController.clear();
                        _quantityMediumController.clear();
                        _quantityLargeController.clear();

                        Navigator.pop(context);
                      },
                      child: Text(
                        'Add to Queue',
                      )),
                )
              ],
            ),
          );
        });
  }

  Widget _buildQuantityOption(
      BuildContext context, String quantity, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      height: 64,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xffF6F0E9), borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            quantity,
            style: TextStyle(
                fontSize: 16,
                color: Color(0xff6C331E),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 50,
            child: TextField(
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff6C331E),
                  fontWeight: FontWeight.bold),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xff6C331E),
                    ),
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
