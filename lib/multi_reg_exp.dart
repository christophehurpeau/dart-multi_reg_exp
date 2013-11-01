library multi_reg_exp;

import 'dart:collection';
import 'package:meta/meta.dart';

part 'multi_reg_exp_iterable.dart';
part 'string_container.dart';

class MultiRegExp implements RegExp{
  Iterable<RegExp> regExps;
  
  MultiRegExp() : this.regExps = new List();
  MultiRegExp.fromIterable(Iterable<RegExp> this.regExps);
  
  Iterable<Match> allMatches(String input) {
    return new MultiRegExpIterable.fromString(this,input);
  }
  Iterable<Match> allMatchesFromStringContainer(StringContainer stringContainer) {
    return new MultiRegExpIterable(this,stringContainer);
  }

  Match firstMatch(String input) {
    //print('--- MultiRegExp: firstMatch "'+input+'"---');
    Match found = null, m;
    for(RegExp regExp in this.regExps){
      m = regExp.firstMatch(input);
      //print('RegExp= '+regExp.pattern+'; match= '+(m == null ? 'null' : m[0]));
      if(m != null && (found == null || m.start < found.start))
        found = m;
    }
    //print('--- MultiRegExp: firstMatch END ---');
    return found;
  }

  bool hasMatch(String input) {
    for(RegExp regExp in this.regExps){
      if(regExp.hasMatch(input)) return true;
    }
    return false;
  }

  bool get isCaseSensitive => throw new UnsupportedError('MutliRegExp cannot support isCaseSensitive get');

  bool get isMultiLine => throw new UnsupportedError('MutliRegExp cannot support isMultiLine get');

  Match matchAsPrefix(String string, [int start = 0]) {
    Match found = null, m;
    for(RegExp regExp in this.regExps){
      m = regExp.matchAsPrefix(string,start);
      if(m != null && (found == null || m.start < found.start))
        found = m;
    }
    return found;
  }

  String get pattern => throw new UnsupportedError('MutliRegExp cannot support pattern get');

  String stringMatch(String input) {
    throw new UnsupportedError('MutliRegExp cannot support stringMatch');
  }
}