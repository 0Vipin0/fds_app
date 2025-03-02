import '../../Models/upi_id.dart';
import '../../provider/upi_id_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Constants for colors
const Color appBarBackgroundColor = Colors.white;
const Color appBarIconColor = Colors.black;
const Color buttonBackgroundColor = Color(0xFF17BA4D);
const Color checkboxActiveColor = Colors.green;
const Color hintTextColor = Color(0xFFA6A6A6);
const Color textFieldShadowColor = CupertinoColors.activeBlue;

// Constants for text styles
const TextStyle appBarTextStyle = TextStyle(color: appBarIconColor);
const TextStyle screenHeadingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
const TextStyle screenSubHeadingStyle = TextStyle(fontSize: 14);
const TextStyle sectionHeadingStyle = TextStyle(fontWeight: FontWeight.w600);
const TextStyle hintTextStyle = TextStyle(
  color: hintTextColor,
  fontWeight: FontWeight.w500,
);
const TextStyle proceedButtonTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
);

// Constants for sizes and spacing
const double appBarElevation = 0;
const double appBarIconSize = 35;
const double screenPadding = 25.0;
const double sectionSpacingHeightLarge = 70.0;
const double sectionSpacingHeightMedium = 20.0;
const double sectionSpacingHeightSmall = 10.0;
const double textFieldPaddingVertical = 6.0;
const double textFieldPaddingHorizontal = 19.0;
const double checkboxSpacingWidth = 20.0;
const double proceedButtonHeight = 45.0;
const double proceedButtonPaddingHorizontal = 30.0;
const double proceedButtonPaddingVertical = 25.0;
const double textFieldShadowBlurRadius = 7.0;
const Offset textFieldShadowOffset = Offset(0, 5);
const double textFieldBorderRadius = 5.0;

class AddUpiIdScreen extends StatefulWidget {
  const AddUpiIdScreen({super.key});

  @override
  State<AddUpiIdScreen> createState() => _AddUpiIdScreenState();
}

class _AddUpiIdScreenState extends State<AddUpiIdScreen> {
  final _addKey = GlobalKey<FormState>();
  final _upiIDController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _upiIDController.dispose();
    super.dispose();
  }

  String upiID = "";
  bool _checkbox = true;
  UpiID newID = UpiID(id: "", isSelected: true);

  _saveForm() {
    _addKey.currentState?.save();
    newID = UpiID(id: upiID, isSelected: _checkbox);
    Provider.of<UpiIDProvider>(context, listen: false).addUpiID(newID);
  }

  ButtonStyle textButtonStyle = TextButton.styleFrom(
    backgroundColor: buttonBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(textFieldBorderRadius),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarBackgroundColor,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(screenPadding),
        child: Form(
          key: _addKey,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: sectionSpacingHeightMedium),
              const Text("Add UPI ID", style: screenHeadingStyle),
              const Text(
                "Choose Desired UPI ID to get the Loan amount",
                style: screenSubHeadingStyle,
              ),
              const SizedBox(height: sectionSpacingHeightLarge),
              _buildUpiIdInputSection(),
            ],
          ),
        ),
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

  Widget _buildUpiIdInputSection() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: textFieldShadowColor.withOpacity(0.1),
            blurRadius: textFieldShadowBlurRadius,
            offset: textFieldShadowOffset,
          ),
        ],
        color: appBarBackgroundColor,
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: textFieldPaddingVertical),
              child: Image.asset("assets/UPI_Logo.png"),
            ),
            title: const Text("UPI ID"),
          ),
          const SizedBox(height: sectionSpacingHeightMedium),
          const Align(
            alignment: Alignment(-0.7, 0),
            child: Text(
              "Enter your Google Pay Number or UPI ID",
              style: hintTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: textFieldPaddingHorizontal,
              right: textFieldPaddingHorizontal,
            ),
            child: TextField(
              textInputAction: TextInputAction.done,
              controller: _upiIDController,
              onChanged: (val) {
                upiID = val;
              },
              decoration: const InputDecoration(
                hintText: "Your BHIM or UPI ID",
                hintStyle: hintTextStyle,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              const SizedBox(width: sectionSpacingHeightSmall),
              Checkbox(
                tristate: true,
                activeColor: checkboxActiveColor,
                value: _checkbox,
                onChanged: (bool? val) {
                  setState(() {
                    if (val != null) {
                      _checkbox = val;
                    }
                  });
                },
              ),
              const SizedBox(width: checkboxSpacingWidth),
              const Text("Make it Primary UPI ID", style: sectionHeadingStyle),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: proceedButtonPaddingHorizontal,
              right: proceedButtonPaddingHorizontal,
              top: sectionSpacingHeightSmall,
              bottom: proceedButtonPaddingVertical,
            ),
            child: SizedBox(
              height: proceedButtonHeight,
              width: double.maxFinite,
              child: TextButton(
                style: textButtonStyle,
                onPressed: () {
                  _saveForm();
                  Navigator.pushNamed(context, "select_upi");
                },
                child: const Text("Proceed", style: proceedButtonTextStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
