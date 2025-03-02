import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Constants for colors
const Color buttonColor = Color(0xFF17BA4D);
const Color textColor = Color(0xFF707070);

// Constants for spacing and sizes
const double verticalSpaceLarge = 0.104;
const double verticalSpaceMedium = 0.08;
const double verticalSpaceSmall = 0.03;
const double horizontalPaddingPortrait = 60.0;
const double horizontalPaddingLandscape = 150.0;
const double buttonHeight = 50.0;
const double logoHeight = 150.0;

// Constants for font sizes
const double welcomeFontSize = 25.0;
const double buttonFontSize = 15.0;
const double normalFontSize = 18.0;

// Text Styles
const TextStyle welcomeTextStyle = TextStyle(
  fontSize: welcomeFontSize,
  color: textColor,
  fontWeight: FontWeight.bold,
);

const TextStyle buttonTextStyle = TextStyle(
  fontSize: buttonFontSize,
  color: Colors.white,
);

const TextStyle normalTextStyle = TextStyle(
  fontSize: normalFontSize,
  fontWeight: FontWeight.w400,
);
const TextStyle normalBoldButtonTextStyle = TextStyle(
  color: buttonColor,
  fontWeight: FontWeight.w800,
  fontSize: 15,
);
const TextStyle termsAndConditionsStyle = TextStyle(
  decoration: TextDecoration.underline,
  color: Colors.blue,
);

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Orientation currentOrientation = MediaQuery.of(context).orientation;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildLogoAndWelcomeSection(screenHeight),
              _buildFacebookLoginButton(
                currentOrientation,
                context,
                screenHeight,
              ),
              SizedBox(height: screenHeight * 0.105),
              _buildEmailLoginText(),
              SizedBox(height: screenHeight * 0.068),
              _buildLoginButton(currentOrientation, context, screenHeight),
              SizedBox(height: screenHeight * verticalSpaceSmall),
              _buildSignupText(),
              SizedBox(height: screenHeight * 0.075),
              _buildTermsAndConditionsText(),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoAndWelcomeSection(double screenHeight) {
    return Column(
      children: [
        SizedBox(height: screenHeight * verticalSpaceLarge),
        SizedBox(
          height: logoHeight,
          child: SvgPicture.asset(
            "assets/Small_Logo.svg",
            semanticsLabel: 'Dart Logo',
          ),
        ),
        const Center(
          child: Text("Welcome to Loney", style: welcomeTextStyle),
        ),
        SizedBox(height: screenHeight * verticalSpaceMedium),
      ],
    );
  }

  Widget _buildFacebookLoginButton(
    Orientation currentOrientation,
    BuildContext context,
    double screenHeight,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left:
            currentOrientation == Orientation.portrait
                ? horizontalPaddingPortrait
                : horizontalPaddingLandscape,
        right:
            currentOrientation == Orientation.portrait
                ? horizontalPaddingPortrait - 20
                : horizontalPaddingLandscape,
      ),
      child: SizedBox(
        height: buttonHeight,
        child: Row(
          children: <Widget>[
            Image.asset("assets/Facebook_Logo.png"),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.systemGrey.withOpacity(0.2),
                      blurRadius: 7,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                height: buttonHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(backgroundColor: buttonColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Login/Register with Facebook",
                      style: buttonTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailLoginText() {
    return const Center(
      child: Text(
        "Login or Signup Using Email",
        style: normalBoldButtonTextStyle,
      ),
    );
  }

  Widget _buildLoginButton(
    Orientation currentOrientation,
    BuildContext context,
    double screenHeight,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            currentOrientation == Orientation.portrait
                ? horizontalPaddingPortrait +
                    30 // Adjusted padding for portrait
                : horizontalPaddingLandscape +
                    75, // Adjusted padding for landscape
      ),
      child: SizedBox(
        height: buttonHeight,
        width:
            currentOrientation == Orientation.landscape
                ? MediaQuery.of(context).size.width / 2
                : null, // No width constraint in portrait
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () => Navigator.pushNamed(context, "login_signup"),
          child: Text("Log in", style: buttonTextStyle),
        ),
      ),
    );
  }

  Widget _buildSignupText() {
    return const Center(child: Text("Signup", style: normalTextStyle));
  }

  Widget _buildTermsAndConditionsText() {
    return const Center(
      child: Text.rich(
        TextSpan(
          text: 'By signing up, you agree with our ',
          children: <TextSpan>[
            TextSpan(
              text: 'Terms and Conditions',
              style: termsAndConditionsStyle,
            ),
          ],
        ),
      ),
    );
  }
}
