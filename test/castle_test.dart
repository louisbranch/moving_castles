import 'package:unittest/unittest.dart';
import '../web/dart/castle.dart';

void main() {

  group('#new', () {
    newCastle(width, height) => new Castle('Baldurs Gate', [[], []], 'castle.png');

    var castle = newCastle(1,2);

    test('has a name', () => expect(castle.name, 'Baldurs Gate'));
    test('has 2 dimensional list of tiles', () => expect(castle.tiles[0], []));
    test('has a tileset path', () => expect(castle.tileset, 'castle.png'));
  });
}
