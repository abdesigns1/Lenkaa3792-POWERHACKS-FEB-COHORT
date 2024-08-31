import 'package:flutter/material.dart';

import '../constant.dart';

// MyTextButton is a StatelessWidget for creating a styled text button.
class MyTextButton extends StatelessWidget {
  // Constructor for the MyTextButton widget.
  const MyTextButton({
    Key? key,
    required this.buttonName, // The text displayed on the button.
    required this.onTap, // The callback function to execute when the button is tapped.
    required this.bgColor, // The background color of the button.
    required this.textColor, // The text color of the button.
  }) : super(key: key);

  final String buttonName; // The text displayed on the button.
  final Function
      onTap; // The callback function to execute when the button is tapped.
  final Color bgColor; // The background color of the button.
  final Color textColor; // The text color of the button.

  @override
  Widget build(BuildContext context) {
    // Container widget for defining the size and decoration of the button.
    return Container(
      height: 60,
      // The height of the button.
      width: double.infinity,
      // The width of the button to take the full width of its parent.
      // BoxDecoration for styling the button with a background color and rounded corners.
      decoration: BoxDecoration(
        color: bgColor, // The background color of the button.
        borderRadius: BorderRadius.circular(
            18), // The border radius to create rounded corners.
      ),
      // TextButton widget for creating a clickable text button.
      child: TextButton(
        // ButtonStyle for additional styling like overlay color when pressed.
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith(
            (states) =>
                Colors.black12, // The overlay color when the button is pressed.
          ),
        ),
        // onPressed callback for defining the action when the button is tapped.
        onPressed: () => onTap(),
        // Text widget to display the button text with the specified style.
        child: Text(
          buttonName, // The text displayed on the button.
          style: kButtonText.copyWith(
              color: textColor), // Styling for the button text.
        ),
      ),
    );
  }
}
