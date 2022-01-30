class AddSymbol {
  String add(String symbol, String nValue, int pValue) {
    if (nValue.isEmpty || pValue == 0) {
      nValue = symbol;
      
    } else if (pValue >= nValue.length) {
      nValue = nValue + symbol;
    } else {
      nValue = nValue.substring(0, pValue) + symbol + nValue.substring(pValue);
    }
    if (!nValue.contains(RegExp(r'[\d\.]')) && nValue.length == 1) {
      nValue = '';
    }
    return nValue;
  }
}
