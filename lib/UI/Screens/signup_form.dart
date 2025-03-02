import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Constants for colors
const Color textFieldBackgroundColor = Colors.white;
const Color textFieldPlaceholderColor = Colors.grey;
const Color shadowColorOpacity = Colors.grey;
const Color signUpButtonColor = CupertinoColors.activeGreen;
const Color termsAndConditionsTextColor = Colors.blue;

// Constants for text styles
const TextStyle textFieldPlaceholderStyle = TextStyle(
  color: textFieldPlaceholderColor,
  fontWeight: FontWeight.w400,
);
const TextStyle signUpButtonStyle = TextStyle(
  fontSize: 18,
  fontFamily: 'Roboto',
);
const TextStyle termsAndConditionsStyle = TextStyle(
  fontSize: 12.5,
  decoration: TextDecoration.underline,
  color: termsAndConditionsTextColor,
);

// Constants for sizes and spacing
const double textFieldBorderRadius = 5.0;
const double textFieldPaddingVertical = 18.0;
const double textFieldPaddingHorizontal = 20.0;
const double buttonHeight = 0.07;
const double buttonWidth = double.maxFinite;
const double buttonBorderRadius = 5.0;
const double shadowBlurRadius = 5.0;
const double shadowSpreadRadius = 8.0;
const Offset shadowOffset = Offset(0, 5);
const double eyeViewIconPaddingRight = 14.0;

// Constants for SizedBox heights - consistent naming for better readability
const double sizedBoxHeightSmall = 0.017;
const double sizedBoxHeightMedium = 0.03;
const double sizedBoxHeightLarge = 0.035;

// Constants for padding values
const EdgeInsets textFieldContentPadding = EdgeInsets.only(
  left: textFieldPaddingHorizontal,
  bottom: textFieldPaddingVertical,
  top: textFieldPaddingVertical,
);
const EdgeInsets eyeViewPadding = EdgeInsets.only(
  right: eyeViewIconPaddingRight,
);
const EdgeInsets screenHorizontalPadding = EdgeInsets.only(left: 50, right: 50);

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();
  final _confirmPasswordNode = FocusNode();
  final _phoneNode = FocusNode();
  final _signupKey = GlobalKey<FormState>();

  String? _name;
  String? _email;
  String? _password;
  String? _confirmPassword;
  String? _phoneNumber;

  @override
  void dispose() {
    _emailNode.dispose();
    _confirmPasswordNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  void _saveform() {
    _signupKey.currentState?.save();
    print(_name);
    print(_email);
    print(_password);
    print(_confirmPassword);
    print(_phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Form(
      key: _signupKey,
      child: ListView(
        padding: screenHorizontalPadding,
        children: <Widget>[
          SizedBox(height: height * sizedBoxHeightMedium),
          _buildNameTextField(),
          SizedBox(height: height * sizedBoxHeightSmall),
          _buildEmailTextField(),
          SizedBox(height: height * sizedBoxHeightSmall),
          _buildPasswordTextField(),
          SizedBox(height: height * sizedBoxHeightSmall),
          _buildConfirmPasswordTextField(),
          SizedBox(height: height * sizedBoxHeightSmall),
          _buildPhoneNumberTextField(),
          SizedBox(height: height * sizedBoxHeightLarge),
          _buildSignUpButton(height),
          SizedBox(height: height * sizedBoxHeightMedium),
          _buildTermsAndConditionsText(),
          SizedBox(height: height * sizedBoxHeightMedium),
        ],
      ),
    );
  }

  Widget _buildNameTextField() {
    return CupertinoTextField(
      cursorRadius: const Radius.circular(15),
      textInputAction: TextInputAction.next,
      onSubmitted: (val) => FocusScope.of(context).requestFocus(_emailNode),
      placeholder: "Full Name",
      placeholderStyle: textFieldPlaceholderStyle,
      padding: textFieldContentPadding,
      decoration: _textFieldDecoration(),
    );
  }

  Widget _buildEmailTextField() {
    return CupertinoTextField(
      placeholder: "Email Address",
      focusNode: _emailNode,
      onSubmitted: (val) => FocusScope.of(context).requestFocus(_passwordNode),
      placeholderStyle: textFieldPlaceholderStyle,
      padding: textFieldContentPadding,
      decoration: _textFieldDecoration(),
    );
  }

  Widget _buildPasswordTextField() {
    return CupertinoTextField(
      obscureText: true,
      focusNode: _passwordNode,
      onSubmitted:
          (val) => FocusScope.of(context).requestFocus(_confirmPasswordNode),
      suffix: Padding(
        padding: eyeViewPadding,
        child: Image.asset("assets/Eye_View.png"),
      ),
      placeholder: "Choose your Password",
      placeholderStyle: textFieldPlaceholderStyle,
      padding: textFieldContentPadding,
      decoration: _textFieldDecoration(),
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return CupertinoTextField(
      obscureText: true,
      focusNode: _confirmPasswordNode,
      onSubmitted: (val) => FocusScope.of(context).requestFocus(_phoneNode),
      suffix: Padding(
        padding: eyeViewPadding,
        child: Image.asset("assets/Eye_View.png"),
      ),
      placeholder: "Confirm your Password",
      placeholderStyle: textFieldPlaceholderStyle,
      padding: textFieldContentPadding,
      decoration: _textFieldDecoration(),
    );
  }

  Widget _buildPhoneNumberTextField() {
    return CupertinoTextField(
      keyboardType: TextInputType.number,
      focusNode: _phoneNode,
      onSubmitted: (val) => _saveform(),
      placeholder: "Phone Number",
      placeholderStyle: textFieldPlaceholderStyle,
      padding: textFieldContentPadding,
      decoration: _textFieldDecoration(),
    );
  }

  BoxDecoration _textFieldDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(textFieldBorderRadius),
      boxShadow: [
        BoxShadow(
          offset: shadowOffset,
          blurRadius: shadowBlurRadius,
          spreadRadius: shadowSpreadRadius,
          color: shadowColorOpacity.withOpacity(0.08),
        ),
      ],
      color: textFieldBackgroundColor,
    );
  }

  Widget _buildSignUpButton(double height) {
    return Container(
      height: height * buttonHeight,
      width: buttonWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(buttonBorderRadius),
        boxShadow: [
          BoxShadow(
            offset: shadowOffset,
            blurRadius: shadowBlurRadius,
            spreadRadius: shadowSpreadRadius,
            color: shadowColorOpacity.withOpacity(0.1),
          ),
        ],
        color: textFieldBackgroundColor,
      ),
      child: CupertinoButton(
        color: signUpButtonColor,
        onPressed: () {
          if (_password == _confirmPassword) {
            Navigator.pushNamed(context, 'home_screen');
            print(_name);
            print(_email);
            print(_password);
            print(_confirmPassword);
            print(_phoneNumber);
          }
        },
        borderRadius: BorderRadius.circular(buttonBorderRadius),
        child: const Text("SIGN UP", style: signUpButtonStyle),
      ),
    );
  }

  Widget _buildTermsAndConditionsText() {
    return const Center(
      child: Text.rich(
        TextSpan(
          style: TextStyle(fontSize: 12.5),
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
