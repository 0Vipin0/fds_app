import '../../UI/widgets/result_widget.dart';
import 'package:flutter/material.dart';

class DeclinedRequestScreen extends StatelessWidget {
  const DeclinedRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResultScreen(
      result: "Request Declined!",
    );
  }
}
