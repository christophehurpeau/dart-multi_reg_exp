import 'package:unittest/unittest.dart';
import '../lib/multi_reg_exp.dart';

void main(){
  test('String Container', () {
    const String TEST_STRING = 'Test';

    var stringContainer = new StringContainer(TEST_STRING);
    expect(stringContainer.string, TEST_STRING);
  });

}
