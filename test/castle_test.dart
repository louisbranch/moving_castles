import 'package:unittest/unittest.dart';
import '../web/dart/castle.dart';

void main() {

  group('#new', () {
    var castle = new Castle('Baldurs Gate', [], 2, 2, 'castle.png');

    test('has a name', () => expect(castle.name, 'Baldurs Gate'));
    test('has width size', () => expect(castle.width, 2));
    test('has height size', () => expect(castle.height, 2));
    test('has list of tiles', () => expect(castle.tiles.isEmpty, true));
    test('has a tileset path', () => expect(castle.tileset, 'castle.png'));
  });

}
