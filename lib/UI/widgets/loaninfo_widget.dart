import 'package:flutter/material.dart';

// Constants for colors
const Color tableBackgroundColor =
    Colors.green; // Default color, can be overridden
const Color tableTextColor = Colors.white;

// Constants for text styles
const TextStyle tableTextStyle = TextStyle(color: tableTextColor);

// Constants for sizes and spacing
const double widgetPadding = 12.0;
const double columnWidthRatio1 = 2.0;
const double columnWidthRatio2 = 1.0;

class LoanInfoWidget extends StatefulWidget {
  final Color color;
  final String startDate;
  final String endDate;
  final String tenure;
  final double loanAmount;

  const LoanInfoWidget({
    super.key,
    this.color = tableBackgroundColor,
    this.startDate = "",
    this.endDate = "",
    this.tenure = "",
    this.loanAmount = 0,
  });

  @override
  State<LoanInfoWidget> createState() => _LoanInfoWidgetState();
}

class _LoanInfoWidgetState extends State<LoanInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: Padding(
        padding: const EdgeInsets.all(widgetPadding),
        child: Table(
          columnWidths: const {
            0: FlexColumnWidth(columnWidthRatio1),
            1: FlexColumnWidth(columnWidthRatio2),
          },
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Text(
                    "Credit Taken on: ${widget.startDate}",
                    style: tableTextStyle,
                  ),
                ),
                TableCell(
                  child: Text("${widget.loanAmount} Rs", style: tableTextStyle),
                ),
              ],
            ),
            TableRow(
              children: [
                TableCell(
                  child: Text(
                    "Credit Due on: ${widget.endDate}",
                    style: tableTextStyle,
                  ),
                ),
                TableCell(
                  child: Text(
                    "Tenure :${widget.tenure}",
                    style: tableTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
