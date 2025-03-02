import 'package:flutter/material.dart';

// Constants for colors
const Color appBarBackgroundColor = Colors.white;
const Color appBarIconColor = Colors.black;
const Color payButtonColor = Color(0xFF17BA4D);
const Color textFieldIconBackgroundColor = Colors.white; // Assuming TextField Icon background is white
const Color textFieldHintTextColor = Colors.grey;

// Constants for text styles
const TextStyle appBarTextStyle = TextStyle(color: appBarIconColor);
const TextStyle screenHeadingStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
const TextStyle screenSubHeadingStyle = TextStyle(fontSize: 14);
const TextStyle textFieldHintStyle = TextStyle(color: textFieldHintTextColor);
const TextStyle payButtonStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
);

// Constants for sizes and spacing
const double appBarElevation = 0;
const double appBarIconSize = 35;
const double screenPadding = 25.0;
const double sectionSpacingHeightLarge = 50.0;
const double sectionSpacingHeightMedium = 20.0;
const double sectionSpacingHeightSmall = 10.0;
const double textFieldHeight = 40.0;
const double textFieldIconPaddingTop = 15.0;
const double textFieldRowSpacing = 20.0;
const double payButtonBorderRadius = 10.0;
const double payButtonPaddingVertical = 15.0;
const double payButtonPaddingHorizontal = 10.0;


class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _cardNumberController = TextEditingController();
  final _expDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardNameController = TextEditingController();

  final _expDateFocusNode = FocusNode();
  final _cvvFocusNode = FocusNode();
  final _cardNameFocusNode = FocusNode();

  final _cardKey = GlobalKey<FormState>();

  String? cardNumber;
  String? expDate;
  int? cvv;
  String? cardName;

  var _init = true;
  String? _currentLoanID;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expDateController.dispose();
    _cvvController.dispose();
    _cardNameController.dispose();
    _expDateFocusNode.dispose();
    _cvvFocusNode.dispose();
    _cardNameFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_init) {
      final loanID = ModalRoute.of(context)?.settings.arguments;
      if (loanID != null) {
        _currentLoanID = loanID as String?;
      }
    }
    _init = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    _cardKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarBackgroundColor,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(screenPadding),
        child: Form(
          key: _cardKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: sectionSpacingHeightMedium),
                  const Text(
                    "Add Card",
                    style: screenHeadingStyle,
                  ),
                  const Text(
                    "Choose desired Payment Method to Add",
                    style: screenSubHeadingStyle,
                  ),
                  SizedBox(height: sectionSpacingHeightLarge),
                  _buildCardNumberTextField(),
                  SizedBox(height: sectionSpacingHeightMedium),
                  _buildExpDateCVVRow(),
                  SizedBox(height: sectionSpacingHeightMedium),
                  _buildCardNameTextField(),
                ],
              ),
              _buildPayButton(context),
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

  Widget _buildCardNumberTextField() {
    return SizedBox(
      height: textFieldHeight,
      width: double.maxFinite,
      child: TextField(
        controller: _cardNumberController,
        keyboardType: TextInputType.number,
        onChanged: (val) {
          cardNumber = val;
        },
        onSubmitted: (_) {
          FocusScope.of(context).requestFocus(_expDateFocusNode);
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          icon: Padding(
            padding: const EdgeInsets.only(top: textFieldIconPaddingTop),
            child: Image.asset("assets/Card_Logo2.png"),
          ),
          hintText: "Enter Card Number",
          hintStyle: textFieldHintStyle,
        ),
      ),
    );
  }

  Widget _buildExpDateCVVRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: TextField(
            controller: _expDateController,
            focusNode: _expDateFocusNode,
            onChanged: (val) {
              expDate = val;
            },
            onSubmitted: (_) {
              FocusScope.of(context).requestFocus(_cvvFocusNode);
            },
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: "Exp Date",
              hintStyle: textFieldHintStyle,
            ),
          ),
        ),
        const SizedBox(
          width: textFieldRowSpacing,
        ),
        Flexible(
          child: TextField(
            controller: _cvvController,
            focusNode: _cvvFocusNode,
            onChanged: (val) {
              cvv = int.parse(val);
            },
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) {
              FocusScope.of(context).requestFocus(_cardNameFocusNode);
            },
            decoration: const InputDecoration(
              hintText: "CVV",
              hintStyle: textFieldHintStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardNameTextField() {
    return SizedBox(
      width: double.maxFinite,
      height: textFieldHeight,
      child: TextField(
        controller: _cardNameController,
        focusNode: _cardNameFocusNode,
        onChanged: (val) {
          cardName = val;
        },
        onSubmitted: (_) {
          _saveForm();
        },
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          hintText: "Name",
          hintStyle: textFieldHintStyle,
        ),
      ),
    );
  }


  Widget _buildPayButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: payButtonPaddingHorizontal,
          right: payButtonPaddingHorizontal,
          top: sectionSpacingHeightSmall,
          bottom: sectionSpacingHeightMedium),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(payButtonBorderRadius),
          color: payButtonColor,
        ),
        width: MediaQuery.of(context).size.width,
        child: TextButton(
          onPressed: () => Navigator.pushNamed(
              context, "success_result",
              arguments: _currentLoanID),
          child: const Text(
            "Pay",
            style: payButtonStyle,
          ),
        ),
      ),
    );
  }
}