import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QueueCard extends StatelessWidget {
  final String name;
  final int flavor;

  const QueueCard({
    super.key,
    required this.name,
    required this.flavor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      width: 382,
      decoration: BoxDecoration(
          color: Color(0xffF6F0E9), borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6C331E),
                ),
              ),
              Text(
                "${flavor.toString()} flavor${flavor > 1 ? "s" : ""}",
                style: GoogleFonts.inter(color: Color(0xffA84F2F)),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [],
          ),
        ],
      ),
    );
  }
}
