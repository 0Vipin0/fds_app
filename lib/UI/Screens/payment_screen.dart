import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Constants for colors
const Color appBarBackgroundColor = Colors.white;
const Color appBarIconColor = Colors.black;
const Color paymentMethodIconColor = Color(0xFF3D56F5);
const Color cancelButtonColor = Color(0xFF17BA4D);
const Color boxShadowColor = CupertinoColors.activeBlue;

// Constants for text styles
const TextStyle appBarTextStyle = TextStyle(
  color: appBarIconColor,
  fontSize: 35,
);
const TextStyle screenHeadingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
const TextStyle screenSubHeadingStyle = TextStyle(fontSize: 14);
const TextStyle paymentMethodTitleStyle = TextStyle(
  fontWeight: FontWeight.normal,
);
const TextStyle cancelButtonTextStyle = TextStyle(
  fontSize: 22,
  color: Colors.white,
);

// Constants for sizes and spacing
const double appBarElevation = 0;
const double appBarIconSize = 35;
const double screenPaddingHorizontal = 15.0;
const double screenHeadingSizedBoxHeight = 20.0;
const double paymentMethodsSizedBoxHeight = 50.0;
const double paymentMethodTilePadding = 8.0;
const double paymentMethodIconPaddingRight = 8.0;
const double paymentMethodIconPaddingLeft = 8.0;
const double paymentMethodTrailingIconSize = 35.0;
const double paymentMethodTileBoxShadowBlurRadius = 5.0;
const Offset paymentMethodTileBoxShadowOffset = Offset(0, 5);
const double paymentMethodTileBorderRadius = 10.0;
const double cancelButtonHeight = 60.0;
const double cancelButtonPaddingHorizontal = 30.0;
const double cancelButtonPaddingBottom = 50.0;
const double cancelButtonBorderRadius = 10.0;
const double cancelButtonBoxShadowBlurRadius = 10.0;
const Offset cancelButtonBoxShadowOffset = Offset(0, 5);
const double paymentMethodsSpacingHeight = 10.0;
const double portraitOrientationSpacing = 210.0;
const double landscapeOrientationSpacing = 0.0;

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var _init = true;
  String? _currentloanID;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_init) {
      final loanID = ModalRoute.of(context)?.settings.arguments as String?;
      if (loanID != null) {
        _currentloanID = loanID;
      }
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Orientation currentOrientation = MediaQuery.of(context).orientation;
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              left: screenPaddingHorizontal,
              right: screenPaddingHorizontal,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: screenHeadingSizedBoxHeight),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Add Payment Method", style: screenHeadingStyle),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Choose desired Payment Method to Pay",
                    style: screenSubHeadingStyle,
                  ),
                ),
                const SizedBox(height: paymentMethodsSizedBoxHeight),
                Padding(
                  padding: const EdgeInsets.all(paymentMethodTilePadding),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: paymentMethodTileBoxShadowOffset,
                          blurRadius: paymentMethodTileBoxShadowBlurRadius,
                          color: boxShadowColor.withOpacity(0.2),
                        ),
                      ],
                      color: appBarBackgroundColor,
                    ),
                    child: ListTile(
                      onTap:
                          () => Navigator.pushNamed(
                            context,
                            "add_card",
                            arguments: _currentloanID,
                          ),
                      leading: Padding(
                        padding: const EdgeInsets.only(
                          right: paymentMethodIconPaddingRight,
                          left: paymentMethodIconPaddingLeft,
                        ),
                        child: Image.asset("assets/Card_Logo.png"),
                      ),
                      title: const Text(
                        "Credit or Debit Card",
                        style: paymentMethodTitleStyle,
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        size: paymentMethodTrailingIconSize,
                        color: paymentMethodIconColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: paymentMethodsSpacingHeight),
                Padding(
                  padding: const EdgeInsets.all(paymentMethodTilePadding),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: paymentMethodTileBoxShadowOffset,
                          blurRadius: paymentMethodTileBoxShadowBlurRadius,
                          color: boxShadowColor.withOpacity(0.2),
                        ),
                      ],
                      color: appBarBackgroundColor,
                    ),
                    child: ListTile(
                      onTap:
                          () => Navigator.pushNamed(
                            context,
                            "upi_payment",
                            arguments: _currentloanID,
                          ),
                      leading: Image.asset("assets/UPI_Logo.png"),
                      title: const Text("UPI", style: paymentMethodTitleStyle),
                      trailing: const Icon(
                        Icons.chevron_right,
                        size: paymentMethodTrailingIconSize,
                        color: paymentMethodIconColor,
                      ),
                    ),
                  ),
                ),
                currentOrientation == Orientation.portrait
                    ? const SizedBox(height: portraitOrientationSpacing)
                    : const SizedBox(height: landscapeOrientationSpacing),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: cancelButtonPaddingHorizontal,
              right: cancelButtonPaddingHorizontal,
              bottom: cancelButtonPaddingBottom,
            ),
            child: Container(
              height: cancelButtonHeight,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: cancelButtonBoxShadowBlurRadius,
                    offset: cancelButtonBoxShadowOffset,
                  ),
                ],
                color: cancelButtonColor,
                borderRadius: BorderRadius.circular(cancelButtonBorderRadius),
              ),
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed:
                    () => Navigator.pushNamed(context, "declined_request"),
                child: const Text(
                  "Cancel Payment",
                  style: cancelButtonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
