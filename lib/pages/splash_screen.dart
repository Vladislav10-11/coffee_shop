import 'package:coffee_shop/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Brew",
                style: GoogleFonts.inter(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffEDE2D4)),
              ),
              Text(
                'YOUR OWN CUP',
                style: GoogleFonts.inter(
                  color: Color(0xffEDE2D4),
                  fontSize: 32,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset("assets/People.png"),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32), // <-- Radius
                  ),
                  backgroundColor:
                      Color(0xffEDE2D4), // background (button) color
                  foregroundColor: Color(0xff6C331E), // foreground (text) color
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()),
                  );
                },
                child: Text(
                  'Start brewing',
                  style: GoogleFonts.inter(
                      color: Color(0xff6C331E), fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}
