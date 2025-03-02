class UpiID {
  String id;
  bool isSelected;
  UpiID({
    required this.id,
    this.isSelected = true,
  });
  void selectID() {
    isSelected = !isSelected;
  }
}
