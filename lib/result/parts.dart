class PartN {
  String netN(String nValue) {
    List subL = nValue.split('\n');
    subL.removeLast();
    print(subL);
    return subL.join();
  }

  String lastLine(String nValue) {
    return nValue.split('\n').last;
  }

  String fullN(String nValue) {
    return nValue;
  }
}
