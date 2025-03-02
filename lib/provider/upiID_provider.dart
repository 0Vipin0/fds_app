import '../Models/UpiID.dart';
import 'package:flutter/cupertino.dart';

class UpiIDProvider with ChangeNotifier {
  final List<UpiID> _upiIDs = [UpiID(id: "9876543210@UPI", isSelected: true)];

  List<UpiID> get upiIDs => [..._upiIDs];

  void addUpiID(UpiID val) {
    UpiID test = UpiID(id: val.id, isSelected: val.isSelected);
    _upiIDs.add(test);
    notifyListeners();
  }
}
