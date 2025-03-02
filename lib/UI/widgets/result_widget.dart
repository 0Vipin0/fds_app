import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Constants for colors
const Color successButtonColor = Color(0xFF17BA4D);
const Color successBoxShadowColor = CupertinoColors.activeBlue;
const Color homeButtonTextColor = Colors.white;

// Constants for text styles
const TextStyle resultTextStyle = TextStyle(
  fontSize: 38.3,
  fontWeight: FontWeight.w600,
);
const TextStyle homeButtonTextStyle = TextStyle(
  fontSize: 15,
  color: homeButtonTextColor,
);
const TextStyle landscapeHomeButtonTextStyle = TextStyle(
  fontSize: 14,
  color: homeButtonTextColor,
);

// Constants for sizes and spacing
const double successBackgroundImageTop = 180.0;
const double sizedBoxHeightLarge = 145.0;
const double sizedBoxHeightMedium = 50.0;
const double sizedBoxHeightSmall = 100.0;
const double manImageHeight = 250.0;
const double crossImageHeight = 250.0;
const double homeButtonHeightPortrait = 50.0;
const double homeButtonWidthPortrait = double.infinity;
const double homeButtonBorderRadius = 5.0;
const double homeButtonPaddingHorizontalPortrait = 50.0;
const double boxShadowBlurRadius = 8.0;
const Offset boxShadowOffset = Offset(0, 7);
const double homeButtonFlexLandscape = 2.0;
const int expandedFlexLandscape = 1;

class ResultScreen extends StatelessWidget {
  final String result;
  final bool isSucceeded;

  const ResultScreen({super.key, this.result = "", this.isSucceeded = false});

  @override
  Widget build(BuildContext context) {
    Orientation currentOrientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          isSucceeded == true
              ? Positioned(
                top: successBackgroundImageTop,
                child: Image.asset("assets/Success_Background.png"),
              )
              : const SizedBox(),
          ListView(
            children: <Widget>[
              const SizedBox(height: sizedBoxHeightLarge),
              Center(child: Text(result, style: resultTextStyle)),
              const SizedBox(height: sizedBoxHeightMedium),
              isSucceeded == true
                  ? SizedBox(
                    height: manImageHeight,
                    child: Image.asset("assets/Man.png"),
                  )
                  : SizedBox(
                    height: crossImageHeight,
                    child: Image.asset("assets/Cross.png"),
                  ),
              const SizedBox(height: sizedBoxHeightSmall),
              currentOrientation == Orientation.portrait
                  ? Padding(
                    padding: const EdgeInsets.only(
                      left: homeButtonPaddingHorizontalPortrait,
                      right: homeButtonPaddingHorizontalPortrait,
                    ),
                    child: Container(
                      width: homeButtonWidthPortrait,
                      height: homeButtonHeightPortrait,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          homeButtonBorderRadius,
                        ),
                        color: successButtonColor,
                        boxShadow: [
                          BoxShadow(
                            color: successBoxShadowColor.withOpacity(0.2),
                            offset: boxShadowOffset,
                            blurRadius: boxShadowBlurRadius,
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed:
                            () => Navigator.pushNamed(context, "home_screen"),
                        child: const Text(
                          "Go to Home",
                          style: homeButtonTextStyle,
                        ),
                      ),
                    ),
                  )
                  : Row(
                    children: <Widget>[
                      const Expanded(
                        flex: expandedFlexLandscape,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: homeButtonFlexLandscape.toInt(),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: successButtonColor,
                          ),
                          onPressed: () => {},
                          child: const Text(
                            "Go to Home",
                            style: landscapeHomeButtonTextStyle,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: expandedFlexLandscape,
                        child: SizedBox(),
                      ),
                    ],
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
