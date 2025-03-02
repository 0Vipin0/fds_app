import '../../UI/Screens/about_profile.dart';
import '../../UI/Screens/payment_home_screen.dart';
import '../../UI/Screens/term_condtions_screen.dart';
import '../../UI/widgets/loaninfo_widget.dart';
import '../../provider/loan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Constants for colors
const Color buttonColor = Color(0xFF17BA4D);
const Color appBarBackgroundColor = Colors.white;
const Color appBarTextColor = Colors.black;
const Color profileHeaderTextColorBold = Colors.black;
const Color profileHeaderTextColorLight =
    Colors.black38; // Assuming a lighter shade for "Student"
const Color tabBarIndicatorColor = buttonColor;
const Color profileHeaderBorderColor = Color(0xFFEFEFEF);

// Constants for text styles
const TextStyle appBarTitleTextStyle = TextStyle(color: appBarTextColor);
const TextStyle tabTextStyle = TextStyle(color: buttonColor, fontSize: 15);
const TextStyle profileHeaderNameTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
);
const TextStyle profileHeaderSubtitleTextStyle = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w300,
);

// Constants for sizes and spacing
const double appBarElevation = 0;
const double tabBarIndicatorWeight =
    2.0; // Assuming default indicatorWeight if not specified
const double profileHeaderRadius = 40.0;
const double profileHeaderTextSpacing = 10.0;
const double profileHeaderPaddingTop = 20.0;
const double profileHeaderAvatarRightPadding = 40.0;
const double profileEditButtonPaddingBottom = 10.0;
const double profileEditButtonPaddingLeft = 15.0;
const double profileEditButtonPaddingRight = 50.0;
const double profileHeaderEditContainerMarginLeft = 32.0;
const double bottomNavBarIconSize =
    30.0; // Assuming default icon size if not specified

class PaymentInfoScreen extends StatefulWidget {
  const PaymentInfoScreen({super.key});

  @override
  State<PaymentInfoScreen> createState() => _PaymentInfoScreenState();
}

class _PaymentInfoScreenState extends State<PaymentInfoScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final kTabPages = <Widget>[
      const PaymentHomeScreen(),
      _buildPaymentHistoryTabView(buttonColor),
      const TermsCondtionsScreen(),
      const AboutProfile(),
    ];
    final kBottomNavBarItem = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage("assets/Clock_Logo.png")),
        label: "Payments",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.help_outline),
        label: "Item",
      ),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
    ];
    final bottonNavbar = BottomNavigationBar(
      items: kBottomNavBarItem,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );

    final tabs = <Widget>[
      _buildTab("Open loans", tabTextStyle),
      _buildTab("Paid loans", tabTextStyle),
      _buildTab("Requested", tabTextStyle),
    ];

    return DefaultTabController(
      length: _currentIndex == 1 ? 3 : 2,
      child: Scaffold(
        backgroundColor: appBarBackgroundColor,
        appBar: _buildAppBar(tabs, buttonColor, _currentIndex),
        body: kTabPages[_currentIndex],
        bottomNavigationBar: bottonNavbar,
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar(
    List<Widget> tabs,
    Color buttonColor,
    int currentIndex,
  ) {
    if (currentIndex == 1) {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarBackgroundColor,
        title: const Text("Payments", style: appBarTitleTextStyle),
        bottom: TabBar(indicatorColor: tabBarIndicatorColor, tabs: tabs),
      );
    } else if (currentIndex == 3) {
      return PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 4),
        child: Container(
          color: appBarBackgroundColor,
          child: Column(
            children: <Widget>[
              const ProfileHeaderWidget(),
              const SizedBox(height: 35),
              _buildProfileEditButton(),
            ],
          ),
        ),
      );
    }
    return null;
  }

  TabBarView _buildPaymentHistoryTabView(Color buttonColor) {
    return TabBarView(
      children: <Widget>[
        Consumer<LoansProvider>(
          builder: (context, loansData, __) {
            return ListView.builder(
              itemCount: loansData.loans.length,
              itemBuilder: (context, count) {
                return loansData.loans[count].isPaid == false
                    ? GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "payment_method",
                          arguments: loansData.loans[count].loanID,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LoanInfoWidget(
                          loanAmount: loansData.loans[count].loanAmount,
                          startDate: loansData.loans[count].startDate ?? "",
                          endDate: loansData.loans[count].endDate ?? "",
                          tenure: "${loansData.loans[count].tenure} Month",
                          color: buttonColor,
                        ),
                      ),
                    )
                    : const SizedBox();
              },
            );
          },
        ),
        Consumer<LoansProvider>(
          builder: (_, loansData, __) {
            return ListView.builder(
              itemCount: loansData.loans.length,
              itemBuilder: (context, count) {
                return loansData.loans[count].isPaid == true
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LoanInfoWidget(
                        loanAmount: loansData.loans[count].loanAmount,
                        startDate: loansData.loans[count].startDate ?? "",
                        endDate: loansData.loans[count].endDate ?? "",
                        tenure: "${loansData.loans[count].tenure} Month",
                        color: Colors.blue,
                      ),
                    )
                    : const SizedBox();
              },
            );
          },
        ),
        Consumer<LoansProvider>(
          builder: (_, loansData, __) {
            return ListView.builder(
              itemCount: loansData.loans.length,
              itemBuilder: (context, count) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoanInfoWidget(
                    loanAmount: loansData.loans[count].loanAmount,
                    startDate: loansData.loans[count].startDate ?? "",
                    endDate: loansData.loans[count].endDate ?? "",
                    tenure: "${loansData.loans[count].tenure} Month",
                    color: Colors.orange,
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildTab(String text, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: style),
    );
  }

  Widget _buildProfileEditButton() {
    return Container(
      margin: const EdgeInsets.only(left: profileHeaderEditContainerMarginLeft),
      decoration: const BoxDecoration(
        color: appBarBackgroundColor,
        border: Border(bottom: BorderSide(color: profileHeaderBorderColor)),
      ),
      child: Row(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: buttonColor)),
            ),
            child: const Padding(
              padding: EdgeInsets.only(
                bottom: profileEditButtonPaddingBottom,
                left: profileEditButtonPaddingLeft,
                right: profileEditButtonPaddingRight,
              ),
              child: Text(
                "About",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: profileHeaderEditContainerMarginLeft,
              bottom: profileEditButtonPaddingBottom,
            ),
            child: Text(
              "Edit",
              style: TextStyle(color: buttonColor, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: profileHeaderPaddingTop),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: appBarBackgroundColor,
            radius: profileHeaderRadius,
            child: Image.asset("assets/Victor.png"),
          ),
          const Column(
            children: <Widget>[
              Text("Victor Niculici", style: profileHeaderNameTextStyle),
              SizedBox(height: profileHeaderTextSpacing),
              Text("Student", style: profileHeaderSubtitleTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
