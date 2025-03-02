import 'package:flutter/material.dart';
import 'package:shadow/shadow.dart';

// Define constants for colors
const Color gradientColorStart = Color(0xFFFCA785);
const Color gradientColorEnd = Color(0xFFF17A8E);
const Color whiteColor = Colors.white;
const Color greyColor = Colors.grey;
const Color verificationIconColor = Color(0xFFFD7F80);
const Color faqTextColor = Color(0xFFF17A8E);

// Define constants for text styles
const TextStyle verificationTitleStyle = TextStyle(
  fontSize: 22,
  color: whiteColor,
  fontWeight: FontWeight.bold,
);

const TextStyle verificationDescriptionStyle = TextStyle(
  fontSize: 16,
  color: whiteColor,
  fontWeight: FontWeight.w500,
);

const TextStyle faqLinkTextStyle = TextStyle(color: faqTextColor, fontSize: 16);

// Define constants for sizes and spacing
const double screenTopPadding = 25.0;
const double backButtonPaddingTop = 8.0;
const double backButtonIconSize = 40.0;
const double descriptionPaddingHorizontal = 25.0;
const double descriptionPaddingTop = 15.0;
const double shadowPaddingHorizontal = 30.0;
const double shadowPaddingTop = 20.0;
const double shadowScale = 1.0;
const Offset shadowOffset = Offset(0, 15);
const double shadowBlurRadius =
    15.0; // Assuming blurRadius is intended to be related to offset, defining explicitly if used elsewhere.
const double containerBorderRadius = 10.0;
const double listTilePaddingVertical =
    40.0; // Adjust based on visual needs, might be better with different approach for vertical spacing
const double separatorPaddingHorizontal = 80.0;
const double faqIconSize = 30.0;
const double faqSectionSpacing = 40.0;
const double listTileContentPaddingVertical = 40.0;

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.9],
            colors: [gradientColorStart, gradientColorEnd],
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: screenTopPadding),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: backButtonPaddingTop),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.chevron_left,
                      size: backButtonIconSize,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Verification", style: verificationTitleStyle),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: descriptionPaddingHorizontal,
                      right: descriptionPaddingHorizontal,
                      top: descriptionPaddingTop,
                    ),
                    child: Text(
                      "Complete filling all the details of the below ones to get your profile approved for the credit limit.",
                      style: verificationDescriptionStyle,
                      textAlign:
                          TextAlign
                              .center, // Added textAlign for better readability on different screen sizes
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: shadowPaddingHorizontal,
                      right: shadowPaddingHorizontal,
                      top: shadowPaddingTop,
                    ),
                    child: Shadow(
                      options: const ShadowOptions(
                        scale: shadowScale,
                        offset: shadowOffset,
                      ),
                      child: Shadow(
                        options: const ShadowOptions(
                          scale: shadowScale,
                          offset: shadowOffset,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            containerBorderRadius,
                          ),
                          child: Container(
                            color: whiteColor,
                            child: const Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                    top: listTileContentPaddingVertical,
                                  ),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.check,
                                      color: verificationIconColor,
                                    ),
                                    title: Text(
                                      "College & Other Details",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.chevron_right,
                                      color: verificationIconColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: separatorPaddingHorizontal,
                                    right: 35.0,
                                  ),
                                  child: MySeparator(color: greyColor),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                  ),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.check,
                                      color: verificationIconColor,
                                    ),
                                    title: Text(
                                      "College Friend",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.chevron_right,
                                      color: verificationIconColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: separatorPaddingHorizontal,
                                    right: 35.0,
                                  ),
                                  child: MySeparator(color: greyColor),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                  ),
                                  child: ListTile(
                                    leading: SizedBox(),
                                    title: Text(
                                      "Connect Social Account",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.chevron_right,
                                      color: verificationIconColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: separatorPaddingHorizontal,
                                    right: 35.0,
                                  ),
                                  child: MySeparator(color: greyColor),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                  ),
                                  child: ListTile(
                                    leading: SizedBox(),
                                    title: Text(
                                      "Basic Details",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.chevron_right,
                                      color: verificationIconColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: separatorPaddingHorizontal,
                                    right: 35.0,
                                  ),
                                  child: MySeparator(color: greyColor),
                                ),
                                SizedBox(height: listTilePaddingVertical),
                                Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_up,
                                    color: faqTextColor,
                                    size: faqIconSize,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Questions? Read the FAQs",
                                    style: faqLinkTextStyle,
                                  ),
                                ),
                                SizedBox(height: faqSectionSpacing),
                              ],
                            ),
                          ),
                        ),
                      ),
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

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;

  const MySeparator({super.key, this.height = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            );
          }),
        );
      },
    );
  }
}
