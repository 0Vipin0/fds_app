import 'package:flutter_svg/flutter_svg.dart';

import '../../UI/loan_form_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Constants for colors
const Color appBarBackgroundColor = Colors.white;
const Color textColorGrey = Color(0xFF707070);
const Color boxShadowColor = CupertinoColors.activeBlue;
const Color profileVerifiedIconColor = Colors.green;

// Constants for text styles
const TextStyle containerTextStyle = TextStyle(
  color: textColorGrey,
  fontSize: 16,
);

// Constants for sizes and spacing
const double appBarHeightRatio = 0.15;
const double appBarSizedBoxHeight = 40.0;
const double appBarLogoPaddingHorizontal = 30.0;
const double bodyPaddingHorizontal = 30.0;
const double containerBorderRadius = 10.0;
const double containerBoxShadowBlurRadius = 7.0;
const Offset containerBoxShadowOffset = Offset(0, 5);
const double containerPaddingLeft = 15.0;
const double containerPaddingRight = 15.0;
const double containerPaddingTop = 30.0;
const double containerPaddingBottom = 30.0;
const double sizedBoxHeightMedium = 20.0;
const double sizedBoxHeightLarge = 50.0;
const double profileVerifiedIconSize = 45.0;
const double sizedBoxHeightExtraLarge = 60.0;

class PaymentHomeScreen extends StatelessWidget {
  const PaymentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: appBarBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(width, height * appBarHeightRatio),
        child: Column(
          children: <Widget>[
            const SizedBox(height: appBarSizedBoxHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: appBarLogoPaddingHorizontal,
                  ),
                  child: SvgPicture.asset("assets/BlockFizz_Logo.svg"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: appBarLogoPaddingHorizontal,
                  ),
                  child: Image.asset("assets/Notification_Logo.png"),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: bodyPaddingHorizontal,
          right: bodyPaddingHorizontal,
        ),
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(containerBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: boxShadowColor.withOpacity(0.2),
                    offset: containerBoxShadowOffset,
                    blurRadius: containerBoxShadowBlurRadius,
                  ),
                ],
                color: appBarBackgroundColor,
              ),
              padding: const EdgeInsets.only(
                left: containerPaddingLeft,
                right: containerPaddingRight,
                top: containerPaddingTop,
                bottom: containerPaddingBottom,
              ),
              child: const Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Available Credit : ", style: containerTextStyle),
                      Text("10,000 Rs", style: containerTextStyle),
                    ],
                  ),
                  SizedBox(height: sizedBoxHeightMedium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Total Credit : ", style: containerTextStyle),
                      Text("10,000 Rs", style: containerTextStyle),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: sizedBoxHeightMedium),
            const LoanRequestForm(),
            const SizedBox(height: sizedBoxHeightLarge),
            const SizedBox(
              width: 50,
              child: ImageIcon(
                AssetImage("assets/Profile_Verified.png"),
                size: profileVerifiedIconSize,
                color: profileVerifiedIconColor,
              ),
            ),
            const SizedBox(height: sizedBoxHeightExtraLarge),
          ],
        ),
      ),
    );
  }
}
