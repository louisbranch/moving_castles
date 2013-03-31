import 'package:unittest/unittest.dart';
import '../src/castle.dart';

void main() {

  group('New Castle', () {
    var castle = new Castle(name: 'Baldurs Gate');

    test('has a name', () => expect('Baldurs Gate', castle.name));
    test('x size defaults to 5', () => expect(5, castle.x));
    test('y size defaults to 5', () => expect(5, castle.y));

  });

}
