class Loan {
  final String loanID;
  final double loanAmount;
  final double? conCharges;
  final double? taxes;
  final int? tenure;
  final String? startDate;
  final String? endDate;
  final double? totalAmount;
  bool isPaid;

  Loan({
    required this.loanID,
    required this.loanAmount,
    this.isPaid = false,
    this.conCharges,
    this.taxes,
    this.tenure,
    this.startDate,
    this.endDate,
    this.totalAmount,
  });

  void loanPaidStatus() {
    isPaid = true;
  }
}
