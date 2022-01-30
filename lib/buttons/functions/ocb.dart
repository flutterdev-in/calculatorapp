class OCB {
  List<int> ocb(String toSplit, String openBra, String closedBra) {
    String leftString = toSplit.split("bk").first;
    int openBra = 0;
    int closedBra = 0;
    for (String i in leftString.split('')) {
      if (i == "\u207D") {
        openBra++;
      }
      if (i == "\u207E") {
        closedBra++;
      }
    }
    return [openBra, closedBra];
  }
}
