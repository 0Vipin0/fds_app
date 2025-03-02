import '../../provider/loan_provider.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart' as lipsum;
import 'package:provider/provider.dart';

// Constants for colors
const Color appBarBackgroundColor = Colors.white;
const Color appBarIconColor = Colors.black;
const Color agreeButtonColor = Color(0xFF17BA4D);
const Color declineButtonColor = Color(0xFFEB658D);

// Constants for text styles
const TextStyle appBarTextStyle = TextStyle(color: appBarIconColor);
const TextStyle screenTitleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.w900);
const TextStyle termsOfServiceStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
const TextStyle agreementTextStyle = TextStyle(fontSize: 14);
const TextStyle agreeButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 17,
  fontWeight: FontWeight.bold,
);
const TextStyle declineButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 17,
  fontWeight: FontWeight.bold,
);

// Constants for sizes and spacing
const double appBarElevation = 0;
const double appBarIconSize = 35;
const double screenPaddingHorizontal = 20.0;
const double screenPaddingTop = 20.0;
const double termsHeadingPaddingTop = 15.0;
const double agreementPaddingAll = 20.0;
const double buttonPanelPaddingAll = 20.0;
const double buttonHeight = 46.0; // Agree Button Height
const double declineButtonHeight = 45.0;
const double buttonBorderRadius = 100.0;
const double boxShadowBlurRadius = 5.0;
const Offset boxShadowOffset = Offset(0, 5);
const double boxShadowSpreadRadius = 3.0;
const double checkIconHeight = 55.0;
const double retryIconHeight = 25.0;
const double agreeButtonOpacity = 1.0;
const double declineButtonOpacity = 1.0;


class LoanAgreementScreen extends StatelessWidget {
  const LoanAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarBackgroundColor,
      appBar: _buildAppBar(context),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: screenPaddingHorizontal, top: screenPaddingTop),
                child: Text(
                  "Loan Agreement",
                  style: screenTitleStyle,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: screenPaddingHorizontal, top: termsHeadingPaddingTop),
                child: Text(
                  "Terms of Services",
                  style: termsOfServiceStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(agreementPaddingAll),
                child: Text(
                  lipsum.loremIpsum(paragraphs: 6, words: 50),
                  style: agreementTextStyle,
                ),
              ),
            ],
          ),
          _buildAgreeButton(context),
          _buildDeclineButton(context),
          _buildCheckIcon(),
          _buildRetryIcon(),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
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
    );
  }

  Positioned _buildAgreeButton(BuildContext context) {
    return Positioned(
      bottom: 75,
      right: 1,
      left: 1,
      child: Padding(
        padding: const EdgeInsets.all(buttonPanelPaddingAll),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: agreeButtonColor.withOpacity(0.2),
                blurRadius: boxShadowBlurRadius,
                offset: boxShadowOffset,
                spreadRadius: boxShadowSpreadRadius,
              ),
            ],
          ),
          height: buttonHeight,
          width: MediaQuery.of(context).size.width,
          child: Opacity(
            opacity: agreeButtonOpacity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: agreeButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonBorderRadius)),
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, "payment_method"),
              child: const Text(
                "Agree",
                style: agreeButtonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Positioned _buildDeclineButton(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 1,
      left: 1,
      child: Padding(
        padding: const EdgeInsets.all(buttonPanelPaddingAll),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: declineButtonColor.withOpacity(0.2),
                blurRadius: boxShadowBlurRadius,
                offset: boxShadowOffset,
                spreadRadius: boxShadowSpreadRadius,
              ),
            ],
          ),
          height: declineButtonHeight,
          width: MediaQuery.of(context).size.width,
          child: Opacity(
            opacity: declineButtonOpacity,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: declineButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(buttonBorderRadius)),
              ),
              onPressed: () {
                Provider.of<LoansProvider>(context, listen: false).deleteLasttLoan();
                Navigator.pop(context);
              },
              child: const Text("Decline",
                  style: declineButtonTextStyle),
            ),
          ),
        ),
      ),
    );
  }

  Positioned _buildCheckIcon() {
    return Positioned(
      bottom: 90,
      left: 20,
      child: SizedBox(
        height: checkIconHeight,
        child: Image.asset("assets/Check.png"),
      ),
    );
  }

  Positioned _buildRetryIcon() {
    return Positioned(
      bottom: 50,
      left: 35,
      child: SizedBox(
        height: retryIconHeight,
        child: Image.asset("assets/Retry.png"),
      ),
    );
  }
}