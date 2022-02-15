class RegEx {
  Iterable<String> listMatch(String pattern, String nValue) {
    RegExp r = RegExp(pattern); // + - / *
    Iterable<String> l = r.allMatches(nValue).map((Match m) {
      return m.input.substring(m.start, m.end);
    });
    return l;
  }
}

Iterable<String?> regexListMatch(String pattern, String nValue) {
  RegExp r = RegExp(pattern); // + - / *
  Iterable<String?> l = r.allMatches(nValue).map((Match m) {
    return m.input.substring(m.start, m.end);
  });
  return l;
}
