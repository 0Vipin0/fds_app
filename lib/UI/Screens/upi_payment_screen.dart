import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Constants for colors
const Color appBarBackgroundColor = Colors.white;
const Color appBarIconColor = Colors.black;
const Color proceedButtonColor = Color(0xFF17BA4D);
const Color expansionTileTrailingIconColor = CupertinoColors.activeBlue;
const Color boxShadowColorGrey = Colors.grey;

// Constants for text styles
const TextStyle screenHeadingStyle = TextStyle(fontSize: 24);
const TextStyle screenSubHeadingStyle = TextStyle(fontSize: 14);
const TextStyle proceedButtonTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
);
const TextStyle expansionTileTitleTextStyle = TextStyle(
  fontWeight: FontWeight.normal,
); // Assuming default is normal

// Constants for sizes and spacing
const double appBarElevation = 0;
const double appBarIconSize = 35.0;
const double screenPaddingHorizontal = 15.0;
const double sizedBoxHeightSmall = 20.0;
const double sizedBoxHeightMedium = 50.0;
const double proceedButtonBorderRadius = 5.0;
const double proceedButtonPaddingVertical = 30.0;
const double proceedButtonPaddingHorizontal = 30.0;
const double expansionTileTrailingIconSize = 35.0;
const double expansionTileLeadingPaddingTop = 7.0;
const double expansionTileChildrenPaddingTop = 15.0;
const double expansionTileChildrenPaddingBottom = 30.0;
const double textFieldPaddingHorizontal = 15.0;
const double containerBoxShadowBlurRadius = 5.0;
const Offset containerBoxShadowOffset = Offset(0, 5);
const double proceedButtonContainerPaddingTop = 50.0;

class UpiPaymentScreen extends StatefulWidget {
  const UpiPaymentScreen({super.key});

  @override
  State<UpiPaymentScreen> createState() => _UpiPaymentScreenState();
}

class _UpiPaymentScreenState extends State<UpiPaymentScreen> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarBackgroundColor,
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor,
        elevation: appBarElevation,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: appBarIconColor,
            size: appBarIconSize,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: screenPaddingHorizontal,
          right: screenPaddingHorizontal,
        ),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: sizedBoxHeightSmall),
            const Text("UPI Payment Options", style: screenHeadingStyle),
            const Text(
              "Choose desired Payment Method to Add",
              style: screenSubHeadingStyle,
            ),
            const SizedBox(height: sizedBoxHeightMedium),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: boxShadowColorGrey.withOpacity(0.2),
                    blurRadius: containerBoxShadowBlurRadius,
                    offset: containerBoxShadowOffset,
                  ),
                ],
                color: appBarBackgroundColor,
              ),
              child: Column(
                children: <Widget>[
                  ExpansionTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(
                        top: expansionTileLeadingPaddingTop,
                      ),
                      child: Image.asset("assets/Bhim_Logo.png"),
                    ),
                    title: const Text(
                      "BHIM",
                      style: expansionTileTitleTextStyle,
                    ),
                    trailing:
                        _expanded == true
                            ? const Icon(
                              Icons.keyboard_arrow_down,
                              size: expansionTileTrailingIconSize,
                              color: expansionTileTrailingIconColor,
                            )
                            : const Icon(
                              Icons.chevron_right,
                              size: expansionTileTrailingIconSize,
                              color: expansionTileTrailingIconColor,
                            ),
                    onExpansionChanged: (bool value) {
                      setState(() {
                        _expanded = value;
                      });
                    },
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(
                          top: expansionTileChildrenPaddingTop,
                        ),
                        child: Align(
                          alignment: Alignment(-0.85, 0),
                          child: Text("Enter your BHIM Number or UPI ID"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: textFieldPaddingHorizontal,
                          right: textFieldPaddingHorizontal,
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Your BHIM or UPI ID",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: proceedButtonPaddingHorizontal,
                          right: proceedButtonPaddingHorizontal,
                          top: proceedButtonContainerPaddingTop,
                          bottom: proceedButtonPaddingVertical,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              proceedButtonBorderRadius,
                            ),
                            color: proceedButtonColor,
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                            onPressed:
                                () => Navigator.pushNamed(context, "add_upi"),
                            child: const Text(
                              "Proceed",
                              style: proceedButtonTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(
                        top: expansionTileLeadingPaddingTop,
                        right: 10,
                      ),
                      child: Image.asset("assets/Paytm_Logo.png"),
                    ),
                    title: const Text("Paytm", style: expansionTileTitleTextStyle),
                    trailing: const Icon(
                      Icons.chevron_right,
                      size: expansionTileTrailingIconSize,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
