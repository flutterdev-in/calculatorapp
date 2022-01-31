class OCB {
  List<int> ocb(String toSplit, String openBra, String closedBra) {
    int openBra = 0;
    int closedBra = 0;
    for (String i in toSplit.split('')) {
      if (i == openBra) {
        openBra++;
      }
      if (i == closedBra) {
        closedBra++;
      }
    }
    return [openBra, closedBra];
  }
}
