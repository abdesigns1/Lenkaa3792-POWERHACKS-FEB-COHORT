import 'package:flutter/material.dart';
import 'package:flutter_calculator/screen/home_screen.dart';
import 'package:flutter_calculator/widget/text_button.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/wall.jpg'), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 250.0,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'FavBIN',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                      fontSize: 48.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text('Perfect solution to \nbinary problems',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 20.0, color: Colors.white)),
                // Adding some space between text and button
                SizedBox(
                  height: 20.0,
                ),
                // Get Started Button
                MyTextButton(
                    buttonName: 'Get Started',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    },
                    bgColor: Colors.white,
                    textColor: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
