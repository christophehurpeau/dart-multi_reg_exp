part of multi_reg_exp;

class StringContainer {
  String _string;

  StringContainer(this._string);

  String get string => _string;

  Iterable<Match> allMatches(RegExp regExp) {
    return regExp.allMatches(string);
  }

  Iterable<Match> allMatchesFromMultiRegExp(MultiRegExp multiRegExp) {
    return new MultiRegExpIterable(multiRegExp, this);
  }
}