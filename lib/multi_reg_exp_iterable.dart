part of multi_reg_exp;

class MultiRegExpIterable extends IterableBase<Match> implements Iterator<Match> {
  MultiRegExp multiRegExp;
  StringContainer input;

  MultiRegExpIterable.fromString(MultiRegExp this.multiRegExp,String input) : this.input = new StringContainer(input);
  MultiRegExpIterable(MultiRegExp this.multiRegExp,StringContainer this.input);

  Iterator<Match> get iterator => this;

  Match _match;
  int _currentIndex = 0;

  Match get current => this._match;

  bool moveNext() {
    //print('--- MultiRegExpIterable: next ---');
    Match found = null, m;
    String currentInput = input.string.substring(_currentIndex);
    for(RegExp regExp in multiRegExp.regExps){
      m = regExp.firstMatch(currentInput);
      //print('RegExp= '+regExp.pattern+'; match= '+(m == null ? 'null' : m[0]));
      if(m != null && (found == null || m.start < found.start)) {
        found = m;
      }
    }
    //print('found: '+(found == null ? 'null' : found[0]));
    //print('--- MultiRegExpIterable: next END ---');
    if (found == null) {
      return false;
    }
    _match = found;
    _currentIndex += found.start;
    return true;
  }
}