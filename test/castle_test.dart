import 'package:unittest/unittest.dart';
import '../web/dart/castle.dart';
import '../web/dart/hero.dart';
import '../web/dart/building.dart';

void main() {

  group('New Castle:', () {
    var castle = new Castle('Baldurs Gate');

    test('has a name', () => expect(castle.name, 'Baldurs Gate'));
    test('width size defaults to 5', () => expect(castle.width, 5));
    test('height size defaults to 5', () => expect(castle.height, 5));
    test('has an empty layers list', () => expect(castle.layers.isEmpty, true));

  });

}
