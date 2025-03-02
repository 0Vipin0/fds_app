class User {
  String name;
  String email;
  String phoneNumber;
  String? location;
  bool? isNotificationEnabled;
  String? upiID;
  bool? isVerified;
  String password;

  User({
    required this.password,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.location,
    this.isNotificationEnabled,
    this.upiID,
    this.isVerified,
  });
}
