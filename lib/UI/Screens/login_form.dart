import '../../provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Constants for colors
const Color buttonColor = Color(0xFF17BA4D);
const Color forgotPasswordTextColor = Color(0xFF1F54C3);
const Color textFieldBackgroundColor = Colors.white;
const Color textFieldPlaceholderColor = Colors.grey;
const Color dividerColor = Colors.grey;
const Color facebookButtonColor = buttonColor;
const Color facebookButtonTextColor = Colors.white;
const Color shadowColorOpacity = Colors.grey;
const Color loginButtonColor = CupertinoColors.activeGreen;

// Constants for text styles
const TextStyle textFieldPlaceholderStyle = TextStyle(
  color: textFieldPlaceholderColor,
  fontWeight: FontWeight.w400,
);

const TextStyle loginButtonStyle = TextStyle(
  fontSize: 18,
  fontFamily: 'Roboto',
);

const TextStyle forgotPasswordStyle = TextStyle(color: forgotPasswordTextColor);

const TextStyle facebookLoginTextStyle = TextStyle(
  fontSize: 15.0,
  color: facebookButtonTextColor,
);

// Constants for sizes and spacing
const double textFieldBorderRadius = 5.0;
const double textFieldPaddingVertical = 18.0;
const double textFieldPaddingHorizontal = 20.0;
const double buttonHeight = 0.07;
const double buttonWidth = double.maxFinite;
const double buttonBorderRadius = 5.0;
const double dividerThickness = 2.0;
const double facebookButtonHeight = 50.0;
const double shadowBlurRadius = 5.0;
const double shadowSpreadRadius = 8.0;
const Offset shadowOffset = Offset(0, 5);
const double facebookLogoSize = 50.0;

// Constants for SizedBox heights
const double sizedBoxHeightSmall = 0.03;
const double sizedBoxHeightMedium = 0.035;
const double sizedBoxHeightLarge = 0.05;
const double sizedBoxHeightExtraLarge = 0.055;
const double sizedBoxHeightTextFieldLarge = 0.065;

// Constants for padding values
const EdgeInsets textFieldContentPadding = EdgeInsets.only(
  left: textFieldPaddingHorizontal,
  bottom: textFieldPaddingVertical,
  top: textFieldPaddingVertical,
);
const EdgeInsets facebookButtonPadding = EdgeInsets.only(right: 10, left: 10);
const EdgeInsets eyeViewPadding = EdgeInsets.only(right: 14.0);
const EdgeInsets screenHorizontalPadding = EdgeInsets.only(left: 50, right: 50);

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordNode = FocusNode();
  final _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  String? _email;
  String? _password;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  void _saveform() {
    _key.currentState?.save();
    print(_email);
    print(_password);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final usersData = Provider.of<UserProvider>(context);
    final userData = usersData.user;

    return Form(
      key: _key,
      child: ListView(
        padding: screenHorizontalPadding,
        children: <Widget>[
          SizedBox(height: height * sizedBoxHeightTextFieldLarge),
          _buildEmailTextField(),
          SizedBox(height: height * sizedBoxHeightMedium),
          _buildPasswordTextField(),
          SizedBox(height: height * sizedBoxHeightMedium),
          _buildLoginButton(height, userData),
          SizedBox(height: height * sizedBoxHeightSmall),
          _buildForgotPasswordLink(),
          SizedBox(height: height * sizedBoxHeightExtraLarge),
          const Divider(thickness: dividerThickness),
          SizedBox(height: height * sizedBoxHeightLarge),
          _buildFacebookLoginButton(height),
        ],
      ),
    );
  }

  Widget _buildEmailTextField() {
    return CupertinoTextField(
      controller: _emailController,
      textInputAction: TextInputAction.next,
      onChanged: (val) {
        _email = val;
      },
      onSubmitted: (value) {
        FocusScope.of(context).requestFocus(_passwordNode);
      },
      placeholder: "Email Address",
      placeholderStyle: textFieldPlaceholderStyle,
      padding: textFieldContentPadding,
      decoration: _textFieldDecoration(),
    );
  }

  Widget _buildPasswordTextField() {
    return CupertinoTextField(
      obscureText: true,
      controller: _passwordController,
      focusNode: _passwordNode,
      textInputAction: TextInputAction.done,
      onChanged: (val) {
        _password = val;
      },
      onSubmitted: (val) {
        _saveform();
      },
      suffix: Padding(
        padding: eyeViewPadding,
        child: Image.asset("assets/Eye_View.png"),
      ),
      placeholder: "Password",
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
          color: shadowColorOpacity.withOpacity(0.1),
        ),
      ],
      color: textFieldBackgroundColor,
    );
  }

  Widget _buildLoginButton(double height, dynamic userData) {
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
        color: loginButtonColor,
        onPressed: () {
          if (userData.email == _email && userData.password == _password) {
            _emailController.clear();
            _passwordController.clear();
            Navigator.pushNamed(context, "home_screen");
          }
        },
        borderRadius: BorderRadius.circular(buttonBorderRadius),
        child: const Text("LOGIN", style: loginButtonStyle),
      ),
    );
  }

  Widget _buildForgotPasswordLink() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'forgot_password');
      },
      child: const Text(
        "Forgot Password?",
        textAlign: TextAlign.left,
        style: forgotPasswordStyle,
      ),
    );
  }

  Widget _buildFacebookLoginButton(double height) {
    return SizedBox(
      height: facebookButtonHeight,
      width: buttonWidth,
      child: Row(
        children: <Widget>[
          Image.asset("assets/Facebook_Logo.png", height: facebookLogoSize),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: shadowColorOpacity.withOpacity(0.2),
                    blurRadius:
                        shadowBlurRadius *
                        1.4, // slightly adjusted blurRadius to 7 from constant
                    spreadRadius: shadowSpreadRadius,
                    offset: shadowOffset,
                  ),
                ],
              ),
              height: facebookButtonHeight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: facebookButtonColor,
                ),
                child: Padding(
                  padding: facebookButtonPadding,
                  child: const Text(
                    "Login/Register with Facebook",
                    style: facebookLoginTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
