import '../../UI/widgets/result_widget.dart';
import '../../provider/loan_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuccessResultScreen extends StatefulWidget {
  const SuccessResultScreen({super.key});

  @override
  State<SuccessResultScreen> createState() => _SuccessResultScreenState();
}

class _SuccessResultScreenState extends State<SuccessResultScreen> {
  var _init = true;
  late String _currentLoanID;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_init) {
      final loanID = ModalRoute.of(context)?.settings.arguments as String?;
      if (loanID != null) {
        _currentLoanID = loanID;
        print(_currentLoanID);
      }
      _init = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loansData = Provider.of<LoansProvider>(context);
    loansData.loanPaid(_currentLoanID);
    return const ResultScreen(result: "Payemnt Success!", isSucceeded: true);
  }
}
