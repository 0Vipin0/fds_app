import '../../provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Constants for colors
const Color profileButtonColor = Color(0xFF17BA4D);
const Color profileHeadingTextColor = Colors.grey;

// Constants for text styles
const TextStyle profileHeadingStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 15,
  color: profileHeadingTextColor,
);

const TextStyle profileSubHeadingStyle = TextStyle(
  fontWeight: FontWeight.w600,
);

const TextStyle profileEditLinkStyle = TextStyle(
  color: profileButtonColor,
  fontSize: 15,
  fontWeight: FontWeight.bold,
);

const TextStyle profileVerifyLinkStyle = TextStyle(
  color: profileButtonColor,
  fontSize: 15,
  fontWeight: FontWeight.bold,
);

// Constants for sizes and spacing
const double profilePaddingTop = 8.0;
const double profilePaddingBottom = 15.0;
const double profilePaddingLeft = 30.0;
const double profileHeadingSpacingVertical = 10.0;
const double profileEditLinkPaddingRight = 30.0;
const double profileVerifyLinkPaddingRight = 22.0;


class AboutProfile extends StatefulWidget {
  const AboutProfile({super.key});

  @override
  State<AboutProfile> createState() => _AboutProfileState();
}

class _AboutProfileState extends State<AboutProfile> {
  @override
  Widget build(BuildContext context) {
    final usersData = Provider.of<UserProvider>(context);
    final userData = usersData.user;
    return Padding(
      padding: const EdgeInsets.only(
          top: profilePaddingTop,
          bottom: profilePaddingBottom,
          left: profilePaddingLeft),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildProfileInfoRow(
            heading: "Name",
            subHeading: userData.name,
          ),
          _buildProfileInfoRow(
            heading: "Email",
            subHeading: userData.email,
          ),
          _buildProfileInfoRow(
            heading: "Phone Number",
            subHeading: userData.phoneNumber,
          ),
          _buildProfileInfoRow(
            heading: "Location",
            subHeading: userData.location ?? "",
          ),
          _buildNotificationRow(userData: userData, setState: setState),
          _buildUPIIDRow(userData: userData),
          _buildVerificationRow(context: context, userData: userData),
        ],
      ),
    );
  }

  Widget _buildProfileInfoRow({required String heading, required String subHeading}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: profileHeadingSpacingVertical),
        Text(
          heading,
          style: profileHeadingStyle,
        ),
        SizedBox(height: profileHeadingSpacingVertical),
        Text(
          subHeading,
          style: profileSubHeadingStyle,
        ),
      ],
    );
  }


  Widget _buildNotificationRow({required dynamic userData, required StateSetter setState}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Receive Notification",
              style: profileHeadingStyle,
            ),
            SizedBox(height: profileHeadingSpacingVertical),
            Text(
              userData.isNotificationEnabled == true ? "Enable" : "Disable",
              style: profileSubHeadingStyle,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: CupertinoSwitch(
            value: userData.isNotificationEnabled ?? false,
            onChanged: (bool val) {
              setState(() {
                userData.isNotificationEnabled = val;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUPIIDRow({required dynamic userData}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "UPI ID",
              style: profileHeadingStyle,
            ),
            SizedBox(height: profileHeadingSpacingVertical),
            Text(
              userData.upiID ?? "",
              style: profileSubHeadingStyle,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: profileEditLinkPaddingRight),
          child: Text(
            "Edit",
            style: profileEditLinkStyle,
          ),
        ),
      ],
    );
  }

  Widget _buildVerificationRow({required BuildContext context, required dynamic userData}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: profilePaddingBottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Verification",
            style: profileSubHeadingStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(right: profileVerifyLinkPaddingRight),
            child: GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushNamed("verification_screen"),
              child: Text(
                userData.isVerified == false ? "Verify" : "",
                style: profileVerifyLinkStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}