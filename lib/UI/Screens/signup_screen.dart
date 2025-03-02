import 'package:flutter_svg/flutter_svg.dart';

import '../../UI/Screens/login_form.dart';
import '../../UI/Screens/signup_form.dart';
import 'package:flutter/material.dart';

// Define constants for colors
const Color buttonColor = Color(0xFF17BA4D);
const Color textColorGrey = Color(0xFF707070);
const Color blackColor = Colors.black;
const Color whiteColor = Colors.white;

// Define constants for text styles
const TextStyle welcomeTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: textColorGrey,
);

const TextStyle tabTextStyle = TextStyle(
  color: blackColor,
  fontSize: 18.0,
  fontWeight: FontWeight.w700,
);

const TextStyle inputHintTextStyle = TextStyle(
  color: Colors.grey, // Example color for hint text, adjust as needed
);

// Define constants for sizes and paddings
const double appBarPreferredHeightFactor = 0.35;
const double logoHeight = 130.0;
const double iconSize = 35.0;
const double tabBarIndicatorWeight = 5.0;
const EdgeInsets tabPadding = EdgeInsets.all(8.0);
const EdgeInsets appBarIconPadding = EdgeInsets.only(left: 8.0);
const EdgeInsets inputContentPadding = EdgeInsets.fromLTRB(
  20.0,
  10.0,
  20.0,
  10.0,
);

// Define constants for input text field paddings
const EdgeInsets inputTextFieldPaddingLWP = EdgeInsets.only(
  left: 100,
  right: 100,
);
const EdgeInsets inputTextFieldPaddingSU = EdgeInsets.only(
  left: 50,
  right: 50,
  bottom: 20,
);
const EdgeInsets inputTextFieldPaddingSUWP = EdgeInsets.only(
  left: 125,
  right: 125,
  bottom: 10,
);

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: _buildAppBar(height),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[LoginForm(), SignUpForm()],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(double height) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height * appBarPreferredHeightFactor),
      child: Container(
        color: whiteColor,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: height * 0.04),
                  const Padding(
                    padding: appBarIconPadding,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.chevron_left, size: iconSize),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child:
                        SvgPicture.asset("assets/Small_Logo.svg", height: logoHeight),
                  ),
                  const Center(
                    child: Text(
                      "Welcome to Loney",
                      style: welcomeTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              controller: _tabController,
              indicatorColor: buttonColor,
              indicatorWeight: tabBarIndicatorWeight,
              tabs: const [
                Padding(
                  padding: tabPadding,
                  child: Text("Login", style: tabTextStyle),
                ),
                Padding(
                  padding: tabPadding,
                  child: Text("Signup", style: tabTextStyle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final EdgeInsetsGeometry padding;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    this.hintText,
    this.obscureText = false,
    required this.padding,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        elevation: 10.0,
        shadowColor: blackColor,
        child: SizedBox(
          height: 50.0, // Consistent height for all input fields
          child: TextFormField(
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: inputContentPadding,
              hintText: hintText,
              hintStyle: inputHintTextStyle,
              // Apply hint text style
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ),
    );
  }
}

class InputTextFieldLWP extends StatelessWidget {
  final String? value;
  final bool? setEye;

  const InputTextFieldLWP({super.key, this.value, this.setEye});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      padding: inputTextFieldPaddingLWP,
      hintText: value,
      obscureText: setEye == true, // Conditionally obscure text
      suffixIcon: setEye == true ? Image.asset("assets/Eye_View.png") : null,
    );
  }
}

class InputTextFieldSU extends StatelessWidget {
  final String? value;
  final bool? setEye;

  const InputTextFieldSU({super.key, this.value, this.setEye});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      padding: inputTextFieldPaddingSU,
      hintText: value,
      obscureText: setEye == true, // Conditionally obscure text
      suffixIcon: setEye == true ? Image.asset("assets/Eye_View.png") : null,
    );
  }
}

class InputTextFieldSUWP extends StatelessWidget {
  final String? value;
  final bool? setEye;

  const InputTextFieldSUWP({super.key, this.value, this.setEye = false});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      padding: inputTextFieldPaddingSUWP,
      hintText: value,
      obscureText: setEye == true, // Conditionally obscure text
      suffixIcon: setEye == true ? Image.asset("assets/Eye_View.png") : null,
    );
  }
}
