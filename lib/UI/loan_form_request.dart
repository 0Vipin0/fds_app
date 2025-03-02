import '../Models/Loan.dart';
import '../provider/loan_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// Constants for colors
const Color buttonColor = Color(0xFF17BA4D);
const Color textFieldBackgroundColor = Colors.grey;
const Color whiteColor = Colors.white;

// Constants for text styles
const TextStyle getCreditTextStyle = TextStyle(
  color: buttonColor,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
const TextStyle tenureTextStyleBold = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
const TextStyle tenureTextStyleNormal = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
);
const TextStyle rsButtonTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
const TextStyle requestButtonTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 17,
  color: whiteColor,
);

// Constants for sizes and spacing
const double borderRadiusCircular = 10.0;
const double boxShadowBlurRadius = 7.0;
const Offset boxShadowOffset = Offset(0, 5);
const double paddingTextFieldRow = 15.0;
const double paddingTextFieldColumn = 30.0;
const double sizedBoxHeightMedium = 20.0;
const double sizedBoxHeightLarge = 40.0;
const double textFieldHeight = 30.0;
const double textFieldCircularRadius = 5.0;
const double rsButtonMarginHorizontal = 10.0;
const double rsButtonPadding = 0.0;

class LoanRequestForm extends StatefulWidget {
  const LoanRequestForm({super.key});

  @override
  State<LoanRequestForm> createState() => _LoanRequestFormState();
}

class _LoanRequestFormState extends State<LoanRequestForm> {
  final _creditController = TextEditingController();
  final _loanKey = GlobalKey<FormState>();
  Loan newLoan = Loan(loanID: DateTime.now().toString(), loanAmount: 0);
  double credit = 0;
  var dateNow = DateTime.now();
  int tenure = 1;
  var formatter = DateFormat('dd-MM-yyyy');

  void _saveForm() {
    _loanKey.currentState?.save();
    String start = formatter.format(dateNow);

    var endDate = dateNow.add(
      tenure == 1
          ? const Duration(days: 30)
          : tenure == 2
          ? const Duration(days: 60)
          : const Duration(days: 90),
    );
    String end = formatter.format(endDate);
    newLoan = Loan(
      loanID: DateTime.now().toString(),
      loanAmount: credit,
      startDate: start,
      endDate: end,
      tenure: tenure,
    );
    Provider.of<LoansProvider>(context, listen: false).addLoan(newLoan);
    dateNow = DateTime.now();
    endDate = DateTime.now();
    tenure = 1;
    start = "";
    end = "";
    Navigator.pushNamed(context, "loan_agreement");
  }

  @override
  void dispose() {
    _creditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _loanKey,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadiusCircular),
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.activeBlue.withOpacity(0.2),
                  offset: boxShadowOffset,
                  blurRadius: boxShadowBlurRadius,
                ),
              ],
              color: whiteColor,
            ),
            padding: const EdgeInsets.only(
              left: paddingTextFieldRow,
              right: paddingTextFieldRow,
              top: paddingTextFieldColumn,
              bottom: paddingTextFieldColumn,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Get Credit ", style: getCreditTextStyle),
                    Expanded(
                      child: CupertinoTextField(
                        controller: _creditController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        onChanged: (val) {
                          credit = double.parse(val);
                        },
                        onSubmitted: (_) {
                          newLoan = Loan(
                            loanID: DateTime.now().toString(),
                            loanAmount: credit,
                          );
                        },
                        suffix: Icon(
                          Icons.keyboard_arrow_down,
                          color: buttonColor,
                        ),
                        decoration: BoxDecoration(
                          color: textFieldBackgroundColor,
                          borderRadius: BorderRadius.circular(
                            textFieldCircularRadius,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: textFieldHeight,
                      margin: const EdgeInsets.only(
                        left: rsButtonMarginHorizontal,
                        right: rsButtonMarginHorizontal,
                      ),
                      child: CupertinoButton(
                        color: buttonColor,
                        onPressed: () {},
                        padding: const EdgeInsets.only(),
                        child: const Text("RS", style: rsButtonTextStyle),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: sizedBoxHeightMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("For Tenure of  ", style: getCreditTextStyle),
                  ],
                ),
                const SizedBox(height: sizedBoxHeightMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tenure = 1;
                        });
                      },
                      child: Text(
                        "1 Month",
                        style:
                            tenure == 1
                                ? tenureTextStyleBold
                                : tenureTextStyleNormal,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tenure = 2;
                        });
                      },
                      child: Text(
                        "2 Month",
                        style:
                            tenure == 2
                                ? tenureTextStyleBold
                                : tenureTextStyleNormal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            tenure = 3;
                          });
                        },
                        child: Text(
                          "3 Month",
                          style:
                              tenure == 3
                                  ? tenureTextStyleBold
                                  : tenureTextStyleNormal,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: sizedBoxHeightLarge),
          Container(
            width: width,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(borderRadiusCircular),
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.activeBlue.withOpacity(0.2),
                  offset: boxShadowOffset,
                  blurRadius: boxShadowBlurRadius,
                ),
              ],
            ),
            child: CupertinoButton(
              onPressed: _saveForm,
              child: const Text("Request", style: requestButtonTextStyle),
            ),
          ),
        ],
      ),
    );
  }
}
