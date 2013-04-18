import 'package:unittest/unittest.dart';
import '../web/dart/castle.dart';

void main() {

  group('new', () {
    var castle = new Castle('Baldurs Gate', [], 5, 5);

    test('has a name', () => expect(castle.name, 'Baldurs Gate'));
    test('has width size', () => expect(castle.width, 5));
    test('has height size', () => expect(castle.height, 5));
    test('has list of layers', () => expect(castle.layers.isEmpty, true));
  });

}
