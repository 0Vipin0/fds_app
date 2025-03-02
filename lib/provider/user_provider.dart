import '../Models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  final User _user = User(
      password: "123456",
      name: "Victor Niculici",
      email: "niculici.victor@gmail.com",
      phoneNumber: "+91 9876543210",
      location: "Bucharest Romania",
      isNotificationEnabled: true,
      upiID: "smith@okhdfc",
      isVerified: true);

  User get user => _user;
}
