import 'package:flutter/material.dart';

// Constants for colors
const Color screenBackgroundColor = Colors.white;
const Color textColor =
    Colors.black87; // Assuming a slightly darker shade for better readability

// Constants for text styles
const TextStyle screenTitleTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: textColor,
); // Slightly larger and bold for titles
const TextStyle menuItemTextStyle = TextStyle(fontSize: 16, color: textColor);

// Constants for sizes and spacing
const double screenPadding = 16.0;
const double titleSpacingHeight = 50.0;
const double menuItemPaddingLeft = 5.0;
const double menuItemPaddingBottom = 20.0;

class TermsCondtionsScreen extends StatelessWidget {
  const TermsCondtionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: titleSpacingHeight),
          Padding(
            padding: EdgeInsets.only(
              left: menuItemPaddingLeft,
              bottom: menuItemPaddingBottom,
            ),
            child: Text("Terms and Conditions", style: screenTitleTextStyle),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: menuItemPaddingLeft,
              bottom: menuItemPaddingBottom,
            ),
            child: Text("Privacy Policy", style: screenTitleTextStyle),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: menuItemPaddingLeft,
              bottom: menuItemPaddingBottom,
            ),
            child: Text("FAQs", style: screenTitleTextStyle),
          ),
          Padding(
            padding: EdgeInsets.only(left: menuItemPaddingLeft),
            child: Text("Contact Us", style: screenTitleTextStyle),
          ),
        ],
      ),
    );
  }
}
