import '../../provider/upi_id_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Constants for colors
const Color appBarBackgroundColor = Colors.white;
const Color appBarIconColor = Colors.black;
const Color checkBoxActiveColor = Colors.green;
const Color proceedButtonColor = Color(0xFF17BA4D);
const Color boxShadowColor = CupertinoColors.activeBlue;
const Color changeUpiIconColor = Colors.grey;

// Constants for text styles
const TextStyle screenHeadingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
const TextStyle screenSubHeadingStyle = TextStyle(fontSize: 14);
const TextStyle upiIdTextStyle = TextStyle(fontWeight: FontWeight.w700);
const TextStyle changeUpiTextStyle = TextStyle(fontWeight: FontWeight.w700);
const TextStyle proceedButtonTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
);

// Constants for sizes and spacing
const double appBarElevation = 0;
const double appBarIconSize = 35;
const double screenPaddingAll = 25.0;
const double sizedBoxHeightSmall = 20.0;
const double sizedBoxHeightMedium = 70.0;
const double sizedBoxHeightLarge = 150.0;
const double sizedBoxHeightExtraLarge = 33.0;
const double checkBoxWidth = 20.0;
const double upiLogoPaddingTop = 6.0;
const double changeUpiIconSize = 32.0;
const double changeUpiSpacing = 35.0;
const double proceedButtonPaddingHorizontal = 30.0;
const double proceedButtonPaddingVerticalTop = 15.0;
const double proceedButtonPaddingVerticalBottom = 20.0;
const double proceedButtonBorderRadius = 10.0;
const double tileBoxShadowBlurRadius = 7.0;
const Offset tileBoxShadowOffset = Offset(0, 5);
const double listViewPaddingLeft = 20.0;

class SelectUpiScreen extends StatefulWidget {
  const SelectUpiScreen({super.key});

  @override
  State<SelectUpiScreen> createState() => _SelectUpiScreenState();
}

class _SelectUpiScreenState extends State<SelectUpiScreen> {
  @override
  Widget build(BuildContext context) {
    final upiIDsData = Provider.of<UpiIDProvider>(context);
    final upiIDData = upiIDsData.upiIDs;
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
        padding: const EdgeInsets.all(screenPaddingAll),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: sizedBoxHeightSmall),
            const Text("Select UPI ID", style: screenHeadingStyle),
            const Text(
              "Choose Desired UPI ID to get the Loan amount",
              style: screenSubHeadingStyle,
            ),
            const SizedBox(height: sizedBoxHeightMedium),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: boxShadowColor.withOpacity(0.2),
                    blurRadius: tileBoxShadowBlurRadius,
                    offset: tileBoxShadowOffset,
                  ),
                ],
                color: appBarBackgroundColor,
              ),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top: upiLogoPaddingTop),
                      child: Image.asset("assets/UPI_Logo.png"),
                    ),
                    title: const Text("UPI ID"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: listViewPaddingLeft),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Select UPI ID"),
                    ),
                  ),
                  SizedBox(
                    height: sizedBoxHeightLarge,
                    child: ListView.builder(
                      itemCount: upiIDData.length,
                      itemBuilder: (context, count) {
                        return upiIDData[count].id != ""
                            ? Row(
                                children: <Widget>[
                                  const SizedBox(width: checkBoxWidth),
                                  Checkbox(
                                    activeColor: checkBoxActiveColor,
                                    value: upiIDData[count].isSelected,
                                    onChanged: (bool? val) {
                                      setState(() {
                                        if (val != null) {
                                          upiIDData[count].isSelected = val;
                                        }
                                      });
                                    },
                                  ),
                                  const SizedBox(width: checkBoxWidth),
                                  Text(upiIDData[count].id,
                                      style: upiIdTextStyle),
                                ],
                              )
                            : null;
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "add_upi"),
                    child: const Row(
                      children: <Widget>[
                        SizedBox(width: changeUpiIconSize),
                        Icon(Icons.add_box, color: changeUpiIconColor),
                        SizedBox(width: changeUpiSpacing),
                        Text("Change UPI ID", style: changeUpiTextStyle),
                      ],
                    ),
                  ),
                  const SizedBox(height: sizedBoxHeightExtraLarge),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: proceedButtonPaddingHorizontal,
                      right: proceedButtonPaddingHorizontal,
                      top: proceedButtonPaddingVerticalTop,
                      bottom: proceedButtonPaddingVerticalBottom,
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
                        onPressed: () => Navigator.popUntil(
                          context,
                          ModalRoute.withName("home_screen"),
                        ),
                        child: const Text(
                          "Proceed",
                          style: proceedButtonTextStyle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: sizedBoxHeightSmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
