import '../../UI/widgets/result_widget.dart';
import 'package:flutter/material.dart';

class SuccessRequestScreen extends StatelessWidget {
  const SuccessRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResultScreen(
      result: "Payment Requested!",
      isSucceeded: true,
    );
  }
}
