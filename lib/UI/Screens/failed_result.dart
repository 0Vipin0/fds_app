import '../../UI/widgets/result_widget.dart';
import 'package:flutter/material.dart';

class FailedResultScreen extends StatelessWidget {
  const FailedResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResultScreen(
      result: "Payment Failed!",
    );
  }
}
