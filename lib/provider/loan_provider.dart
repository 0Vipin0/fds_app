import '../Models/loan.dart';
import 'package:flutter/cupertino.dart';

class LoansProvider with ChangeNotifier {
  final List<Loan> _items = [
    Loan(
      loanID: "1",
      loanAmount: 2000,
      startDate: "Today",
      endDate: "Tommorow",
      tenure: 1,
      conCharges: 50,
      taxes: 2,
      totalAmount: 2052,
      isPaid: false,
    ),
    Loan(
      loanID: "2",
      loanAmount: 2000,
      startDate: "Today",
      endDate: "Tommorow",
      tenure: 1,
      conCharges: 50,
      taxes: 2,
      totalAmount: 2052,
      isPaid: false,
    ),
    Loan(
      loanID: "3",
      loanAmount: 2000,
      startDate: "Today",
      endDate: "Tommorow",
      tenure: 1,
      conCharges: 50,
      taxes: 2,
      totalAmount: 2052,
      isPaid: true,
    ),
  ];

  List<Loan> get loans => [..._items];

  void addLoan(Loan val) {
    Loan item = Loan(
      loanID: val.loanID,
      loanAmount: val.loanAmount,
      startDate: val.startDate,
      endDate: val.endDate,
      tenure: val.tenure,
      isPaid: val.isPaid,
    );
    _items.add(item);
    notifyListeners();
  }

  Loan findByID(String id) {
    return _items.firstWhere((prod) => prod.loanID == id);
  }

  void deleteLasttLoan() {
    _items.removeLast();
  }

  void loanPaid(String id) {
    Loan test = _items.firstWhere((prod) => prod.loanID == id);
    test.loanPaidStatus();
  }
}
