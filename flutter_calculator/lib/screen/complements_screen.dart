import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/text_button.dart';


class ComplementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ComplementsScreen(),
    );
  }
}

class ComplementsScreen extends StatefulWidget {
  @override
  _ComplementsScreenState createState() => _ComplementsScreenState();
}

class _ComplementsScreenState extends State<ComplementsScreen> {
  TextEditingController _inputController = TextEditingController();
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter binary number',
                fillColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.white
                )
              ),
              style: GoogleFonts.poppins(
                color: Colors.white
              ),
            ),
            SizedBox(height: 16.0),
            Text('Result: $_result', style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
            SizedBox(height: 16.0),
            MyTextButton(
                buttonName: "1's Complement",
                onTap: () {
                  setState(() {
                    _result = onesComplement(_inputController.text);
                  });
                },
                bgColor: Colors.green.shade900,
                textColor: Colors.white),
            SizedBox(height: 10,),
            MyTextButton(
                buttonName: "2's Complement",
                onTap: () {
                  setState(() {
                    _result = onesComplement(_inputController.text);
                  });
                },
                bgColor: Colors.green.shade900,
                textColor: Colors.white),
            SizedBox(height: 10,),
            MyTextButton(
                buttonName: "Sign Magnitude",
                onTap: () {
                  setState(() {
                    _result = signMagnitude(_inputController.text);
                  });
                },
                bgColor: Colors.green.shade900,
                textColor: Colors.white),
            SizedBox(height: 10,),
            MyTextButton(
                buttonName: "Unsigned Magnitude",
                onTap: () {
                  setState(() {
                    _result = unsignedMagnitude(_inputController.text);
                  });
                },
                bgColor: Colors.green.shade900,
                textColor: Colors.white),
          ],
        ),
      ),
    );
  }

  String onesComplement(String binary) {
    return binary.replaceAllMapped(
        RegExp('[01]'), (match) => match.group(0) == '0' ? '1' : '0');
  }

  String twosComplement(String binary) {
    String onesComp = onesComplement(binary);
    int carry = 1;
    String result = '';

    for (int i = onesComp.length - 1; i >= 0; i--) {
      int sum = int.parse(onesComp[i]) + carry;
      result = '${sum % 2}$result';
      carry = sum ~/ 2;
    }

    return result;
  }

  String signMagnitude(String binary) {
    String sign = binary[0] == '0' ? '+' : '-';
    String magnitude = binary.substring(1);
    return '$sign$magnitude';
  }

  String unsignedMagnitude(String binary) {
    return binary;
  }
}
